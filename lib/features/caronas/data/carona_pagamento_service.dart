import '../../../core/banco/app_database.dart' show AppDatabase;
import '../../../core/banco/enums.dart';
import '../../financeiro/data/transacao_repository.dart';
import '../../financeiro/domain/transacao.dart';
import '../domain/carona.dart';
import '../domain/carona_com_passageiro.dart';
import 'carona_repository.dart';

class CaronaPagamentoService {
  CaronaPagamentoService(
    this._database,
    this._caronaRepository,
    this._transacaoRepository,
  );

  final AppDatabase _database;
  final CaronaRepository _caronaRepository;
  final TransacaoRepository _transacaoRepository;

  Future<Carona> criar({
    required String passageiroNome,
    String? passageiroTelefone,
    required int valorCentavos,
    required DateTime? data,
    bool pago = false,
    String? origem,
    String? destino,
    String? observacao,
    String usuarioId = 'local',
  }) {
    return _database.transaction(() async {
      final carona = await _caronaRepository.criarEmTransacao(
        passageiroNome: passageiroNome,
        passageiroTelefone: passageiroTelefone,
        valorCentavos: valorCentavos,
        data: data,
        pago: pago,
        origem: origem,
        destino: destino,
        observacao: observacao,
        usuarioId: usuarioId,
      );
      await _sincronizarReceita(carona);
      return carona;
    });
  }

  Future<Carona> editar(Carona carona) {
    return _database.transaction(() async {
      final existente = await _caronaRepository.buscarPorId(carona.id);
      if (existente == null) {
        throw StateError('Carona ativa nao encontrada.');
      }
      final atualizada = await _caronaRepository.editarEmTransacao(carona);
      await _sincronizarReceita(atualizada);
      return atualizada;
    });
  }

  Future<Carona> definirPagamento(String id, {required bool pago}) {
    return _database.transaction(() async {
      final existente = await _caronaRepository.buscarPorId(id);
      if (existente == null) {
        throw StateError('Carona ativa nao encontrada.');
      }
      return _definirPagamentoEmTransacao(existente, pago);
    });
  }

  Future<Carona> alternarPagamento(String id) {
    return _database.transaction(() async {
      final existente = await _caronaRepository.buscarPorId(id);
      if (existente == null) {
        throw StateError('Carona ativa nao encontrada.');
      }
      return _definirPagamentoEmTransacao(existente, !existente.carona.pago);
    });
  }

  Future<void> excluirLogicamente(String id) {
    return _database.transaction(() async {
      final existente = await _caronaRepository.buscarPorId(id);
      if (existente == null) return;

      final receita = await _transacaoRepository.buscarPorCaronaId(id);
      if (receita != null && !receita.excluido) {
        await _transacaoRepository.excluirLogicamente(receita.id);
      }
      await _caronaRepository.excluirLogicamenteEmTransacao(id);
    });
  }

  Future<Carona> _definirPagamentoEmTransacao(
    CaronaComPassageiro existente,
    bool pago,
  ) async {
    final atualizada = existente.carona.pago == pago
        ? existente.carona
        : await _caronaRepository.editarEmTransacao(
            existente.carona.copyWith(pago: pago),
          );
    await _sincronizarReceita(atualizada);
    return atualizada;
  }

  Future<void> _sincronizarReceita(Carona carona) async {
    final receita = await _transacaoRepository.buscarPorCaronaId(carona.id);
    if (!carona.pago) {
      if (receita != null && !receita.excluido) {
        await _transacaoRepository.excluirLogicamente(receita.id);
      }
      return;
    }

    if (receita == null) {
      await _transacaoRepository.criar(
        tipo: TipoTransacao.receita,
        categoria: CategoriaTransacao.carona,
        valorCentavos: carona.valorCentavos,
        data: carona.data,
        descricao: 'Receita da carona',
        caronaId: carona.id,
        usuarioId: carona.usuarioId,
      );
      return;
    }

    final precisaAtualizar =
        receita.excluido ||
        receita.tipo != TipoTransacao.receita ||
        receita.categoria != CategoriaTransacao.carona ||
        receita.valorCentavos != carona.valorCentavos ||
        !receita.data.toUtc().isAtSameMomentAs(carona.data.toUtc()) ||
        receita.usuarioId != carona.usuarioId;
    if (!precisaAtualizar) return;

    await _transacaoRepository.editar(
      Transacao(
        id: receita.id,
        tipo: TipoTransacao.receita,
        categoria: CategoriaTransacao.carona,
        valorCentavos: carona.valorCentavos,
        data: carona.data,
        descricao: receita.descricao ?? 'Receita da carona',
        caronaId: carona.id,
        usuarioId: carona.usuarioId,
        criadoEm: receita.criadoEm,
        atualizadoEm: receita.atualizadoEm,
        excluido: false,
        sincronizado: receita.sincronizado,
      ),
    );
  }
}
