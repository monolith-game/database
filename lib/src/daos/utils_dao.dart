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
    final query = select(serverProfiles).join([
      leftOuterJoin(
        serverSecurityContexts,
        serverProfiles.securityContextId.equalsExp(serverProfiles.id),
      ),
    ])
      ..where(serverProfiles.id.equals(id));
    final result = await query.getSingle();
    return ServerProfileContext.fromResults(db, result);
  }
}
