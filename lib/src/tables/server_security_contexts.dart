import 'package:drift/drift.dart';

import 'mixins.dart';

/// A security context for the server.
class ServerSecurityContexts extends Table with IdMixin {
  /// The path to the chain file.
  TextColumn get chainFilePath => text()();

  /// The password for the chain file.
  TextColumn get chainPassword => text().nullable()();

  /// The path to the key file.
  TextColumn get keyFilePath => text()();

  /// The password for the key file.
  TextColumn get keyPassword => text().nullable()();
}
