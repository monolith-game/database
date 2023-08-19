import 'package:database/database.dart';
import 'package:test/test.dart';

void main() {
  final database = MonolithDatabase();
  tearDownAll(database.close);
  final userAccountsDao = database.userAccountsDao;

  group(
    'UserAccountsDao',
    () {
      test(
        '.createUserAccount',
        () async {
          final userAccount = await userAccountsDao.createUserAccount(
            username: 'test',
            password: 'test',
          );
          expect(userAccount.username, 'test');
          expect(userAccount.passwordHash, startsWith(r'$'));
        },
      );

      test(
        '.authenticate',
        () async {
          final userAccount = await userAccountsDao.createUserAccount(
            username: 'authenticate',
            password: 'test',
          );
          expect(
            await userAccountsDao.authenticate(
              username: userAccount.username,
              password: 'test',
            ),
            userAccount,
          );
          expect(
            await userAccountsDao.authenticate(
              username: userAccount.username,
              password: 'invalid password',
            ),
            null,
          );
          expect(
            await userAccountsDao.authenticate(
              username: 'will never work.',
              password: 'test',
            ),
            null,
          );
        },
      );

      test(
        '.setPassword',
        () async {
          final userAccount = await userAccountsDao.createUserAccount(
            username: 'setPassword',
            password: 'password',
          );
          final updatedUserAccount = await userAccountsDao.setPassword(
            userAccount: userAccount,
            password: 'new password',
          );
          expect(updatedUserAccount.username, userAccount.username);
          expect(
            updatedUserAccount.passwordHash,
            isNot(userAccount.passwordHash),
          );
          expect(
            await userAccountsDao.authenticate(
              username: updatedUserAccount.username,
              password: 'new password',
            ),
            updatedUserAccount,
          );
        },
      );
    },
  );
}
