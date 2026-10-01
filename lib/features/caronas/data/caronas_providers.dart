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

final caronaPorIdProvider = FutureProvider.family<CaronaComPassageiro?, String>(
  (ref, id) {
    return ref.watch(caronaRepositoryProvider).buscarPorId(id);
  },
);

final caronasFiltradasProvider =
    StreamProvider.family<List<CaronaComPassageiro>, CaronaFiltro>((
      ref,
      filtro,
    ) {
      return ref.watch(caronaRepositoryProvider).watchFiltradas(filtro: filtro);
    });

typedef ResumoCaronas = ({int recebidoCentavos, int pendenteCentavos});

final resumoCaronasProvider =
    Provider.family<AsyncValue<ResumoCaronas>, CaronaFiltro>((ref, filtro) {
      return ref.watch(caronasFiltradasProvider(filtro)).whenData((caronas) {
        var recebidoCentavos = 0;
        var pendenteCentavos = 0;
        for (final item in caronas) {
          if (item.carona.pago) {
            recebidoCentavos += item.carona.valorCentavos;
          } else {
            pendenteCentavos += item.carona.valorCentavos;
          }
        }
        return (
          recebidoCentavos: recebidoCentavos,
          pendenteCentavos: pendenteCentavos,
        );
      });
    });
