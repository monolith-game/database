import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';

import '../constants.dart';
import 'daos/rooms/zone_builders_dao.dart';
import 'daos/rooms/zones_dao.dart';
import 'daos/server_profiles/server_profiles_dao.dart';
import 'daos/server_profiles/server_security_contexts_dao.dart';
import 'daos/sounds/sounds_dao.dart';
import 'daos/user_accounts/characters_dao.dart';
import 'daos/user_accounts/user_accounts_dao.dart';
import 'tables/rooms/zone_builders.dart';
import 'tables/rooms/zones.dart';
import 'tables/server_profiles/server_profiles.dart';
import 'tables/server_profiles/server_security_contexts.dart';
import 'tables/sounds/sounds.dart';
import 'tables/user_accounts/characters.dart';
import 'tables/user_accounts/user_accounts.dart';

part 'database.g.dart';

/// The drift database.
@DriftDatabase(
  tables: [
    UserAccounts,
    Characters,
    Sounds,
    ServerProfiles,
    ServerSecurityContexts,
    Zones,
    ZoneBuilders,
  ],
  daos: [
    UserAccountsDao,
    CharactersDao,
    SoundsDao,
    ServerProfilesDao,
    ServerSecurityContextsDao,
    ZonesDao,
    ZoneBuildersDao,
  ],
)
class MonolithDatabase extends _$MonolithDatabase {
  /// Create an instance.
  MonolithDatabase({
    final File? file,
    final bool logStatements = false,
  }) : super(
          file == null
              ? NativeDatabase.memory(
                  logStatements: logStatements,
                )
              : NativeDatabase(
                  file,
                  logStatements: logStatements,
                ),
        );

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
