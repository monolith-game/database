import 'package:drift/drift.dart';

import '../contexts/server_profile_context.dart';
import '../database.dart';
import '../tables/server_profiles.dart';
import '../tables/server_security_contexts.dart';

part 'utils_dao.g.dart';

/// Utility methods.
@DriftAccessor(tables: [ServerProfiles, ServerSecurityContexts])
class UtilsDao extends DatabaseAccessor<MonolithDatabase> with _$UtilsDaoMixin {
  /// Create an instance.
  UtilsDao(super.db);

  /// Get a server profile context from [id].
  Future<ServerProfileContext> getServerProfileContext(final int id) async {
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
    ])
      ..where(serverProfiles.id.equals(id));
    final result = await query.getSingle();
    return ServerProfileContext.fromResults(db, result);
  }
}
