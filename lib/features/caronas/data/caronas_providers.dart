import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/banco/app_database.dart';
import '../domain/carona_com_passageiro.dart';
import 'carona_repository.dart';
import 'passageiro_repository.dart';

final passageiroRepositoryProvider = Provider<PassageiroRepository>(
  (ref) => PassageiroRepository(ref.watch(appDatabaseProvider)),
);

final caronaRepositoryProvider = Provider<CaronaRepository>(
  (ref) => CaronaRepository(ref.watch(appDatabaseProvider)),
);

final caronasFiltradasProvider =
    StreamProvider.family<List<CaronaComPassageiro>, CaronaFiltro>((
      ref,
      filtro,
    ) {
      return ref.watch(caronaRepositoryProvider).watchFiltradas(filtro: filtro);
    });
