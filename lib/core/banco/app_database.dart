import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'enums.dart';
import 'tabelas.dart';

part 'app_database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'caroninha.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(
  tables: [
    Passageiros,
    Caronas,
    Transacoes,
    Abastecimentos,
    ConfiguracoesVeiculo,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.memory() : super(NativeDatabase.memory());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (migrator, from, to) async {
      if (from < 2) {
        await customStatement(
          'CREATE UNIQUE INDEX IF NOT EXISTS '
          'idx_transacoes_carona_id_unique ON transacoes (carona_id)',
        );
        await customStatement(
          'CREATE UNIQUE INDEX IF NOT EXISTS '
          'idx_abastecimentos_transacao_id_unique '
          'ON abastecimentos (transacao_id)',
        );
        await customStatement(
          'CREATE UNIQUE INDEX IF NOT EXISTS '
          'idx_configuracoes_veiculo_usuario_id_unique '
          'ON configuracoes_veiculo (usuario_id)',
        );
      }
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON;');
    },
  );
}

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});
