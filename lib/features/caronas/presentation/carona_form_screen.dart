import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/formatadores.dart';
import '../data/caronas_providers.dart';
import '../data/passageiro_repository.dart';
import '../domain/carona.dart';
import '../domain/carona_com_passageiro.dart';
import '../domain/passageiro.dart';

class CaronaFormScreen extends ConsumerWidget {
  const CaronaFormScreen({this.caronaId, super.key});

  final String? caronaId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (caronaId == null) return const _CaronaFormFields();

    return ref
        .watch(caronaPorIdProvider(caronaId!))
        .when(
          data: (carona) => carona == null
              ? const _EstadoCaronaIndisponivel()
              : _CaronaFormFields(
                  key: ValueKey(carona.carona.id),
                  carona: carona,
                ),
          loading: () =>
              const Scaffold(body: Center(child: CircularProgressIndicator())),
          error: (_, _) => const _EstadoCaronaIndisponivel(),
        );
  }
}

class _EstadoCaronaIndisponivel extends StatelessWidget {
  const _EstadoCaronaIndisponivel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carona')),
      body: const Center(child: Text('Carona não encontrada.')),
    );
  }
}

class _CaronaFormFields extends ConsumerStatefulWidget {
  const _CaronaFormFields({this.carona, super.key});

  final CaronaComPassageiro? carona;

  @override
  ConsumerState<_CaronaFormFields> createState() => _CaronaFormFieldsState();
}

class _CaronaFormFieldsState extends ConsumerState<_CaronaFormFields> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _nomePassageiroController;
  final _valorController = TextEditingController();
  final _origemController = TextEditingController();
  final _destinoController = TextEditingController();
  final _observacaoController = TextEditingController();

  DateTime? _data;
  bool _pago = false;
  String? _passageiroId;
  String? _nomeAssociadoAoPassageiro;

  bool get _editando => widget.carona != null;

  @override
  void initState() {
    super.initState();
    final carona = widget.carona;
    _data = carona?.carona.data.toLocal() ?? DateTime.now();
    _pago = carona?.carona.pago ?? false;
    _passageiroId = carona?.passageiro.id;
    _nomeAssociadoAoPassageiro = carona?.passageiro.nome;
    _valorController.text = carona == null
        ? ''
        : formatarCentavos(carona.carona.valorCentavos);
    _origemController.text = carona?.carona.origem ?? '';
    _destinoController.text = carona?.carona.destino ?? '';
    _observacaoController.text = carona?.carona.observacao ?? '';
  }

  @override
  void dispose() {
    _valorController.dispose();
    _origemController.dispose();
    _destinoController.dispose();
    _observacaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_editando ? 'Editar carona' : 'Nova carona')),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
            children: [
              Autocomplete<Passageiro>(
                initialValue: TextEditingValue(
                  text: widget.carona?.passageiro.nome ?? '',
                ),
                displayStringForOption: (passageiro) => passageiro.nome,
                optionsBuilder: (valor) {
                  final consulta = valor.text.trim();
                  if (consulta.isEmpty) return const <Passageiro>[];
                  return ref
                      .read(passageiroRepositoryProvider)
                      .buscarPorNome(consulta);
                },
                onSelected: (passageiro) {
                  setState(() {
                    _passageiroId = passageiro.id;
                    _nomeAssociadoAoPassageiro = passageiro.nome;
                  });
                },
                fieldViewBuilder:
                    (context, controller, focusNode, onFieldSubmitted) {
                      _nomePassageiroController = controller;
                      return TextFormField(
                        key: const Key('nomePassageiro'),
                        controller: controller,
                        focusNode: focusNode,
                        autofocus: true,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          labelText: 'Nome do passageiro',
                          hintText: 'Digite um nome',
                          prefixIcon: Icon(Icons.person_outline),
                        ),
                        validator: (valor) =>
                            valor == null || valor.trim().isEmpty
                            ? 'Informe o nome do passageiro.'
                            : null,
                        onChanged: (nome) {
                          if (_passageiroId != null &&
                              normalizarNomePassageiro(nome) !=
                                  normalizarNomePassageiro(
                                    _nomeAssociadoAoPassageiro ?? '',
                                  )) {
                            _passageiroId = null;
                          }
                        },
                        onFieldSubmitted: (_) =>
                            FocusScope.of(context).nextFocus(),
                      );
                    },
              ),
              const SizedBox(height: 16),
              TextFormField(
                key: const Key('valorCarona'),
                controller: _valorController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                inputFormatters: [const _CentavosInputFormatter()],
                decoration: const InputDecoration(
                  labelText: 'Valor',
                  hintText: 'R\$ 0,00',
                  prefixIcon: Icon(Icons.payments_outlined),
                ),
                validator: (_) => _valorCentavos <= 0
                    ? 'O valor deve ser maior que zero.'
                    : null,
                onFieldSubmitted: (_) => _salvar(),
              ),
              const SizedBox(height: 8),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.calendar_month_outlined),
                title: const Text('Data'),
                subtitle: Text(
                  _data == null ? 'Selecione uma data' : formatarData(_data!),
                ),
                trailing: const Icon(Icons.edit_calendar_outlined),
                onTap: _selecionarData,
              ),
              if (_data == null)
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    'Selecione uma data.',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              SwitchListTile(
                key: const Key('pagoSwitch'),
                contentPadding: EdgeInsets.zero,
                title: const Text('Pago'),
                value: _pago,
                onChanged: (pago) => setState(() => _pago = pago),
              ),
              ExpansionTile(
                initiallyExpanded: _temCamposOpcionais,
                tilePadding: EdgeInsets.zero,
                title: const Text('Detalhes opcionais'),
                children: [
                  TextFormField(
                    key: const Key('origemCarona'),
                    controller: _origemController,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: const InputDecoration(labelText: 'Origem'),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    key: const Key('destinoCarona'),
                    controller: _destinoController,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: const InputDecoration(labelText: 'Destino'),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    key: const Key('observacaoCarona'),
                    controller: _observacaoController,
                    minLines: 2,
                    maxLines: 4,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: const InputDecoration(labelText: 'Observação'),
                  ),
                  const SizedBox(height: 12),
                ],
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
                key: const Key('excluirCarona'),
                onPressed: _confirmarExclusao,
                icon: const Icon(Icons.delete_outline),
                label: const Text('Excluir'),
              ),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: FilledButton.icon(
                key: const Key('salvarCarona'),
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

  bool get _temCamposOpcionais =>
      _origemController.text.isNotEmpty ||
      _destinoController.text.isNotEmpty ||
      _observacaoController.text.isNotEmpty;

  int get _valorCentavos {
    final digitos = _valorController.text.replaceAll(RegExp(r'[^0-9]'), '');
    return int.tryParse(digitos) ?? 0;
  }

  Future<void> _selecionarData() async {
    final hoje = DateTime.now();
    final selecionada = await showDatePicker(
      context: context,
      initialDate: _data ?? hoje,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      helpText: 'Selecione a data da carona',
      cancelText: 'Cancelar',
      confirmText: 'Confirmar',
    );
    if (selecionada != null) setState(() => _data = selecionada);
  }

  Future<String> _resolverPassageiroId(String nome) async {
    final passageiros = await ref
        .read(passageiroRepositoryProvider)
        .buscarPorNome(nome);
    for (final passageiro in passageiros) {
      if (normalizarNomePassageiro(passageiro.nome) ==
          normalizarNomePassageiro(nome)) {
        return passageiro.id;
      }
    }
    return (await ref.read(passageiroRepositoryProvider).criar(nome: nome)).id;
  }

  Future<void> _salvar() async {
    final valido = _formKey.currentState?.validate() ?? false;
    if (!valido) return;
    if (_data == null) {
      setState(() {});
      return;
    }

    final nome = _nomePassageiroController?.text.trim() ?? '';
    final valorCentavos = _valorCentavos;
    final origem = _textoOpcional(_origemController.text);
    final destino = _textoOpcional(_destinoController.text);
    final observacao = _textoOpcional(_observacaoController.text);
    final servico = ref.read(caronaPagamentoServiceProvider);

    try {
      if (widget.carona == null) {
        await servico.criar(
          passageiroNome: nome,
          valorCentavos: valorCentavos,
          data: _data,
          pago: _pago,
          origem: origem,
          destino: destino,
          observacao: observacao,
        );
      } else {
        final original = widget.carona!;
        final passageiroId = _passageiroId ?? await _resolverPassageiroId(nome);
        await servico.editar(
          Carona(
            id: original.carona.id,
            passageiroId: passageiroId,
            valorCentavos: valorCentavos,
            data: _data!,
            pago: _pago,
            origem: origem,
            destino: destino,
            observacao: observacao,
            usuarioId: original.carona.usuarioId,
            criadoEm: original.carona.criadoEm,
            atualizadoEm: original.carona.atualizadoEm,
            excluido: false,
            sincronizado: original.carona.sincronizado,
          ),
        );
      }
      if (mounted) Navigator.of(context).pop(true);
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Não foi possível salvar a carona.')),
      );
    }
  }

  Future<void> _confirmarExclusao() async {
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Excluir carona?'),
        content: const Text(
          'A carona será removida da lista, mas o registro será mantido.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            key: const Key('confirmarExclusaoCarona'),
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Excluir'),
          ),
        ],
      ),
    );
    if (confirmar != true || !mounted) return;

    await ref
        .read(caronaPagamentoServiceProvider)
        .excluirLogicamente(widget.carona!.carona.id);
    if (mounted) Navigator.of(context).pop(false);
  }

  String? _textoOpcional(String texto) {
    final valor = texto.trim();
    return valor.isEmpty ? null : valor;
  }
}

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
