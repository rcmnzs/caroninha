import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/banco/enums.dart';
import '../../../../core/utils/formatadores.dart';
import '../data/transacao_providers.dart';
import '../domain/transacao.dart';

class DespesaFormScreen extends ConsumerWidget {
  const DespesaFormScreen({this.transacaoId, super.key});

  final String? transacaoId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (transacaoId == null) return const _DespesaFormFields();

    return ref
        .watch(transacaoPorIdProvider(transacaoId!))
        .when(
          data: (transacao) {
            if (transacao == null || transacao.tipo != TipoTransacao.despesa) {
              return const _DespesaIndisponivel();
            }
            return _DespesaFormFields(
              key: ValueKey(transacao.id),
              transacao: transacao,
            );
          },
          loading: () =>
              const Scaffold(body: Center(child: CircularProgressIndicator())),
          error: (_, _) => const _DespesaIndisponivel(),
        );
  }
}

class _DespesaIndisponivel extends StatelessWidget {
  const _DespesaIndisponivel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Despesa')),
      body: const Center(child: Text('Despesa não encontrada.')),
    );
  }
}

class _DespesaFormFields extends ConsumerStatefulWidget {
  const _DespesaFormFields({this.transacao, super.key});

  final Transacao? transacao;

  @override
  ConsumerState<_DespesaFormFields> createState() => _DespesaFormFieldsState();
}

class _DespesaFormFieldsState extends ConsumerState<_DespesaFormFields> {
  final _formKey = GlobalKey<FormState>();
  final _valorController = TextEditingController();
  final _descricaoController = TextEditingController();
  late CategoriaTransacao _categoria;
  DateTime _data = DateTime.now();

  bool get _editando => widget.transacao != null;

  static const _categorias = [
    CategoriaTransacao.combustivel,
    CategoriaTransacao.pedagio,
    CategoriaTransacao.manutencao,
    CategoriaTransacao.estacionamento,
    CategoriaTransacao.outros,
  ];

  @override
  void initState() {
    super.initState();
    final transacao = widget.transacao;
    _categoria = transacao != null && _categorias.contains(transacao.categoria)
        ? transacao.categoria
        : CategoriaTransacao.combustivel;
    if (transacao != null) {
      _data = transacao.data.toLocal();
      _valorController.text = formatarCentavos(transacao.valorCentavos);
      _descricaoController.text = transacao.descricao ?? '';
    }
  }

  @override
  void dispose() {
    _valorController.dispose();
    _descricaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_editando ? 'Editar despesa' : 'Nova despesa'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
            children: [
              DropdownButtonFormField<CategoriaTransacao>(
                key: const Key('categoriaDespesa'),
                initialValue: _categoria,
                decoration: const InputDecoration(
                  labelText: 'Categoria',
                  prefixIcon: Icon(Icons.category_outlined),
                ),
                items: [
                  for (final categoria in _categorias)
                    DropdownMenuItem(
                      value: categoria,
                      child: Text(_nomeCategoria(categoria)),
                    ),
                ],
                onChanged: (categoria) {
                  if (categoria != null) setState(() => _categoria = categoria);
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                key: const Key('valorDespesa'),
                controller: _valorController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                inputFormatters: [const _CentavosInputFormatter()],
                decoration: const InputDecoration(
                  labelText: 'Valor',
                  hintText: 'R\$ 0,00',
                  prefixIcon: Icon(Icons.payments_outlined),
                ),
                validator: (_) => _valorCentavos <= 0
                    ? 'O valor deve ser maior que zero.'
                    : null,
              ),
              const SizedBox(height: 8),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.calendar_month_outlined),
                title: const Text('Data'),
                subtitle: Text(formatarData(_data)),
                trailing: const Icon(Icons.edit_calendar_outlined),
                onTap: _selecionarData,
              ),
              const SizedBox(height: 8),
              TextFormField(
                key: const Key('descricaoDespesa'),
                controller: _descricaoController,
                textCapitalization: TextCapitalization.sentences,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  labelText: 'Descrição (opcional)',
                  prefixIcon: Icon(Icons.notes_outlined),
                ),
                onFieldSubmitted: (_) => _salvar(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 8, 16, 12),
        child: Row(
          children: [
            if (_editando) ...[
              OutlinedButton.icon(
                key: const Key('excluirDespesa'),
                onPressed: _confirmarExclusao,
                icon: const Icon(Icons.delete_outline),
                label: const Text('Excluir'),
              ),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: FilledButton.icon(
                key: const Key('salvarDespesa'),
                onPressed: _salvar,
                icon: const Icon(Icons.check),
                label: const Text('Concluir'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int get _valorCentavos {
    final digitos = _valorController.text.replaceAll(RegExp(r'[^0-9]'), '');
    return int.tryParse(digitos) ?? 0;
  }

  Future<void> _selecionarData() async {
    final selecionada = await showDatePicker(
      context: context,
      initialDate: _data,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      helpText: 'Selecione a data da despesa',
      cancelText: 'Cancelar',
      confirmText: 'Confirmar',
    );
    if (selecionada != null) setState(() => _data = selecionada);
  }

  Future<void> _salvar() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final repository = ref.read(transacaoRepositoryProvider);
    final descricao = _descricaoController.text.trim();

    try {
      if (widget.transacao == null) {
        await repository.criar(
          tipo: TipoTransacao.despesa,
          categoria: _categoria,
          valorCentavos: _valorCentavos,
          data: _data,
          descricao: descricao.isEmpty ? null : descricao,
        );
      } else {
        final original = widget.transacao!;
        await repository.editar(
          Transacao(
            id: original.id,
            tipo: TipoTransacao.despesa,
            categoria: _categoria,
            valorCentavos: _valorCentavos,
            data: _data,
            descricao: descricao.isEmpty ? null : descricao,
            caronaId: null,
            usuarioId: original.usuarioId,
            criadoEm: original.criadoEm,
            atualizadoEm: original.atualizadoEm,
            excluido: false,
            sincronizado: original.sincronizado,
          ),
        );
      }
      if (mounted) Navigator.of(context).pop(true);
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Não foi possível salvar a despesa.')),
      );
    }
  }

  Future<void> _confirmarExclusao() async {
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Excluir despesa?'),
        content: const Text('A despesa será removida da lista financeira.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            key: const Key('confirmarExclusaoDespesa'),
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Excluir'),
          ),
        ],
      ),
    );
    if (confirmar != true || !mounted) return;

    await ref
        .read(transacaoRepositoryProvider)
        .excluirLogicamente(widget.transacao!.id);
    if (mounted) Navigator.of(context).pop(false);
  }
}

String _nomeCategoria(CategoriaTransacao categoria) => switch (categoria) {
  CategoriaTransacao.combustivel => 'Combustível',
  CategoriaTransacao.pedagio => 'Pedágio',
  CategoriaTransacao.manutencao => 'Manutenção',
  CategoriaTransacao.estacionamento => 'Estacionamento',
  CategoriaTransacao.outros => 'Outros',
  CategoriaTransacao.carona => 'Carona',
  CategoriaTransacao.avulsa => 'Avulsa',
};

class _CentavosInputFormatter extends TextInputFormatter {
  const _CentavosInputFormatter();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) return newValue;
    final digitos = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (digitos.isEmpty) return const TextEditingValue();
    final centavos = int.tryParse(digitos);
    if (centavos == null) return oldValue;

    final texto = formatarCentavos(centavos);
    return TextEditingValue(
      text: texto,
      selection: TextSelection.collapsed(offset: texto.length),
    );
  }
}
