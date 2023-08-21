import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/server_profiles.dart';

part 'server_profiles_dao.g.dart';

/// The server profiles DAO.
@DriftAccessor(tables: [ServerProfiles])
class ServerProfilesDao extends DatabaseAccessor<MonolithDatabase>
    with _$ServerProfilesDaoMixin {
  /// Create an instance.
  ServerProfilesDao(super.db);

  /// Create a new row.
  Future<ServerProfile> createServerProfile({
    required final String name,
    required final String host,
    required final int port,
    final ServerSecurityContext? securityContext,
  }) =>
      into(serverProfiles).insertReturning(
        ServerProfilesCompanion(
          host: Value(host),
          name: Value(name),
          port: Value(port),
          securityContextId: Value(securityContext?.id),
        ),
      );

  /// Update [serverProfile].
  Future<ServerProfile> editServerProfile({
    required final ServerProfile serverProfile,
    required final ServerProfilesCompanion companion,
  }) async {
    final query = update(serverProfiles)
      ..where((final table) => table.id.equals(serverProfile.id));
    final rows = await query.writeReturning(companion);
    return rows.single;
  }

  /// Delete [serverProfile].
  Future<int> deleteServerProfile(final ServerProfile serverProfile) =>
      (delete(serverProfiles)
            ..where((final table) => table.id.equals(serverProfile.id)))
          .go();

  /// Get a single row by [id].
  Future<ServerProfile> getServerProfile(final int id) =>
      (select(serverProfiles)..where((final table) => table.id.equals(id)))
          .getSingle();
}
