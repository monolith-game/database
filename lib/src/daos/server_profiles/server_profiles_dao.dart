import 'package:drift/drift.dart';

import '../../contexts/server_profile_context.dart';
import '../../database.dart';
import '../../tables/server_profiles/server_profiles.dart';

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
    final Sound? mainMenuMusic,
    final Sound? menuSelectSound,
    final Sound? menuActivateSound,
  }) =>
      into(serverProfiles).insertReturning(
        ServerProfilesCompanion(
          host: Value(host),
          name: Value(name),
          port: Value(port),
          securityContextId: Value(securityContext?.id),
          mainMenuMusicId: Value(mainMenuMusic?.id),
          menuSelectSoundId: Value(menuSelectSound?.id),
          menuActivateSoundId: Value(menuActivateSound?.id),
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

  /// Get a query that joins all the remote rows.
  JoinedSelectStatement<HasResultSet, dynamic> getJoinedQuery() {
    final mainMenuMusicIdAlias =
        db.alias(sounds, serverProfiles.mainMenuMusicId.name);
    final menuSelectSoundIdAlias = db.alias(
      sounds,
      serverProfiles.menuSelectSoundId.name,
    );
    final menuActivateSoundIdAlias = db.alias(
      sounds,
      serverProfiles.menuActivateSoundId.name,
    );
    final query = select(serverProfiles).join([
      leftOuterJoin(
        serverSecurityContexts,
        serverProfiles.securityContextId.equalsExp(serverSecurityContexts.id),
      ),
      leftOuterJoin(
        mainMenuMusicIdAlias,
        mainMenuMusicIdAlias.id.equalsExp(serverProfiles.mainMenuMusicId),
      ),
      leftOuterJoin(
        menuSelectSoundIdAlias,
        menuSelectSoundIdAlias.id.equalsExp(serverProfiles.menuSelectSoundId),
      ),
      leftOuterJoin(
        menuActivateSoundIdAlias,
        menuActivateSoundIdAlias.id.equalsExp(
          serverProfiles.menuActivateSoundId,
        ),
      ),
    ]);
    return query;
  }

  /// Get a server profile context from [id].
  Future<ServerProfileContext> getServerProfileContext(final int id) async {
    final query = db.serverProfilesDao.getJoinedQuery()
      ..where(serverProfiles.id.equals(id));
    final result = await query.getSingle();
    return ServerProfileContext.fromResults(db, result);
  }

  /// Get all server profiles.
  Future<Iterable<ServerProfileContext>> getServerProfileContexts() async {
    final query = db.serverProfilesDao.getJoinedQuery();
    final results = await query.get();
    return results.map(
      (final e) => ServerProfileContext.fromResults(db, e),
    );
  }
}
