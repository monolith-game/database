import 'dart:io';

import 'package:drift/drift.dart';

import '../../../database.dart';
import '../../tables/server_profiles/server_security_contexts.dart';

part 'server_security_contexts_dao.g.dart';

/// The server security contexts DAO.
@DriftAccessor(tables: [ServerSecurityContexts])
class ServerSecurityContextsDao extends DatabaseAccessor<MonolithDatabase>
    with _$ServerSecurityContextsDaoMixin {
  /// Create an instance.
  ServerSecurityContextsDao(super.db);

  /// Create a new row.
  Future<ServerSecurityContext> createServerSecurityContext({
    required final File chainFile,
    required final File keyFile,
    final String? chainPassword,
    final String? keyPassword,
  }) =>
      into(serverSecurityContexts).insertReturning(
        ServerSecurityContextsCompanion(
          chainFilePath: Value(chainFile.path),
          chainPassword: Value(chainPassword),
          keyFilePath: Value(keyFile.path),
          keyPassword: Value(keyPassword),
        ),
      );

  /// Update [serverSecurityContext].
  Future<ServerSecurityContext> editServerSecurityContext({
    required final ServerSecurityContext serverSecurityContext,
    required final ServerSecurityContextsCompanion companion,
  }) async {
    final query = update(serverSecurityContexts)
      ..where((final table) => table.id.equals(serverSecurityContext.id));
    final rows = await query.writeReturning(companion);
    return rows.single;
  }

  /// Delete [serverSecurityContext].
  Future<int> deleteServerSecurityContext(
    final ServerSecurityContext serverSecurityContext,
  ) =>
      (delete(serverSecurityContexts)
            ..where((final table) => table.id.equals(serverSecurityContext.id)))
          .go();

  /// Get a single row by [id].
  Future<ServerSecurityContext> getServerSecurityContext(final int id) =>
      (select(serverSecurityContexts)
            ..where((final table) => table.id.equals(id)))
          .getSingle();
}
