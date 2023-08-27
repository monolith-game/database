import 'package:drift/drift.dart';

import '../mixins.dart';
import 'user_accounts.dart';

/// The characters table.
class Characters extends Table with IdMixin, NameMixin, UuidMixin {
  /// The ID of the user account which this character belongs to.
  IntColumn get userAccountId =>
      integer().references(UserAccounts, #id, onDelete: KeyAction.cascade)();

  /// Whether or not this character is an admin.
  BoolColumn get isAdmin => boolean().withDefault(const Constant(false))();
}
