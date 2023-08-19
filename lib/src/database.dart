import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';

import 'daos/characters_dao.dart';
import 'daos/user_accounts_dao.dart';
import 'tables/characters.dart';
import 'tables/user_accounts.dart';

part 'database.g.dart';

/// The drift database.
@DriftDatabase(
  tables: [
    UserAccounts,
    Characters,
  ],
  daos: [
    UserAccountsDao,
    CharactersDao,
  ],
)
class MonolithDatabase extends _$MonolithDatabase {
  /// Create an instance.
  MonolithDatabase({final File? file})
      : super(file == null ? NativeDatabase.memory() : NativeDatabase(file));

  /// Schema version.
  @override
  int get schemaVersion => 1;

  /// Run migrations.
  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (final details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
        onCreate: (final m) async {
          await m.createAll();
        },
        onUpgrade: (final m, final from, final to) async {},
      );
}
