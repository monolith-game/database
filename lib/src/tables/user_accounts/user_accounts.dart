import 'package:drift/drift.dart';

import '../mixins.dart';

/// The user accounts table.
class UserAccounts extends Table with IdMixin, UuidMixin {
  /// The username of this account.
  TextColumn get username => text()();

  /// THe password hash.
  TextColumn get passwordHash => text()();
}
