import 'package:drift/drift.dart';

import '../../database.dart';

/// The context for server profiles.
class ServerProfileContext {
  /// Create an instance.
  const ServerProfileContext({
    required this.serverProfile,
    this.securityContext,
  });

  /// Load an instance from [result].
  ServerProfileContext.fromResults(
    final MonolithDatabase database,
    final TypedResult result,
  )   : serverProfile = result.readTable(database.serverProfiles),
        securityContext =
            result.readTableOrNull(database.serverSecurityContexts);

  /// The server profile to use.
  final ServerProfile serverProfile;

  /// The security context for [serverProfile].
  final ServerSecurityContext? securityContext;
}
