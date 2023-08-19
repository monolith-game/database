import 'package:crypt/crypt.dart';
import 'package:drift/drift.dart';

import '../../database.dart';
import '../tables/user_accounts.dart';

part 'user_accounts_dao.g.dart';

/// The user accounts DAO.
@DriftAccessor(tables: [UserAccounts])
@DriftAccessor(tables: [UserAccounts])
class UserAccountsDao extends DatabaseAccessor<MonolithDatabase>
    with _$UserAccountsDaoMixin {
  /// Create an instance.
  UserAccountsDao(super.db);

  /// Create a new row.
  Future<UserAccount> createUserAccount({
    required final String username,
    required final String password,
  }) {
    final passwordHash = Crypt.sha256(password).toString();
    return into(userAccounts).insertReturning(
      UserAccountsCompanion(
        username: Value(username),
        passwordHash: Value(passwordHash),
      ),
    );
  }

  /// Authenticate a user with the given [username] and [password].
  Future<UserAccount?> authenticate({
    required final String username,
    required final String password,
  }) async {
    final query = select(userAccounts)
      ..where((final table) => table.username.equals(username));
    final userAccount = await query.getSingleOrNull();
    if (userAccount == null) {
      return null;
    }
    if (Crypt(userAccount.passwordHash).match(password)) {
      return userAccount;
    }
    return null;
  }

  /// Set a new [password] for [userAccount].
  Future<UserAccount> setPassword({
    required final UserAccount userAccount,
    required final String password,
  }) async {
    final passwordHash = Crypt.sha256(password).toString();
    return editUserAccount(
      userAccount: userAccount,
      companion: UserAccountsCompanion(passwordHash: Value(passwordHash)),
    );
  }

  /// Update [userAccount].
  Future<UserAccount> editUserAccount({
    required final UserAccount userAccount,
    required final UserAccountsCompanion companion,
  }) async {
    final query = update(userAccounts)
      ..where((final table) => table.id.equals(userAccount.id));
    final rows = await query.writeReturning(companion);
    return rows.single;
  }

  /// Delete [userAccount].
  Future<int> deleteUserAccount(final UserAccount userAccount) =>
      (delete(userAccounts)
            ..where((final table) => table.id.equals(userAccount.id)))
          .go();

  /// Get a single row by [id].
  Future<UserAccount> getUserAccount(final int id) =>
      (select(userAccounts)..where((final table) => table.id.equals(id)))
          .getSingle();
}
