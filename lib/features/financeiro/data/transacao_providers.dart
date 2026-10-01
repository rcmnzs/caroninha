import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/banco/app_database.dart';
import '../domain/transacao.dart';
import 'transacao_repository.dart';

typedef PeriodoFinanceiro = ({DateTime? inicio, DateTime? fim});

final transacaoRepositoryProvider = Provider<TransacaoRepository>(
  (ref) => TransacaoRepository(ref.watch(appDatabaseProvider)),
);

final transacoesPorPeriodoProvider =
    StreamProvider.family<List<Transacao>, PeriodoFinanceiro>((ref, periodo) {
      return ref
          .watch(transacaoRepositoryProvider)
          .watchPorPeriodo(periodo.inicio, periodo.fim);
    });

final transacaoPorIdProvider = FutureProvider.family<Transacao?, String>((
  ref,
  id,
) {
  return ref.watch(transacaoRepositoryProvider).buscarPorId(id);
});
