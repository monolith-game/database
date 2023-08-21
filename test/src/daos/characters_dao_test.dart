import 'package:database/database.dart';
import 'package:test/test.dart';

import '../../get_database.dart';

void main() {
  final database = getDatabase();
  final charactersDao = database.charactersDao;
  final userAccountsDao = database.userAccountsDao;
  const password = 'I am a very secure password.';
  late final UserAccount userAccount;

  setUpAll(() async {
    userAccount = await userAccountsDao.createUserAccount(
      username: 'characters_dao',
      password: password,
    );
  });

  group(
    'CharactersDao',
    () {
      test(
        '.createCharacter',
        () async {
          final character = await charactersDao.createCharacter(
            userAccount: userAccount,
            name: 'John',
          );
          expect(character.userAccountId, userAccount.id);
          expect(character.name, 'John');
        },
      );

      test(
        '.getCharacters',
        () async {
          await charactersDao.delete(charactersDao.characters).go();
          final jill = await charactersDao.createCharacter(
            userAccount: userAccount,
            name: 'Jill',
          );
          final jack = await charactersDao.createCharacter(
            userAccount: userAccount,
            name: 'Jack',
          );
          expect(await charactersDao.getCharacters(userAccount), [jill, jack]);
          final z = await charactersDao.createCharacter(
            userAccount: userAccount,
            name: 'Z',
          );
          expect(
            await charactersDao.getCharacters(userAccount),
            [jill, jack, z],
          );
          await charactersDao.deleteCharacter(jack);
          expect(await charactersDao.getCharacters(userAccount), [jill, z]);
        },
      );

      test(
        '.getAllCharacters',
        () async {
          await charactersDao.delete(charactersDao.characters).go();
          final userAccount2 = await userAccountsDao.createUserAccount(
            username: 'characters_dao_2',
            password: 'Whatever.',
          );
          final a = await charactersDao.createCharacter(
            userAccount: userAccount,
            name: 'A',
          );
          final b = await charactersDao.createCharacter(
            userAccount: userAccount2,
            name: 'B',
          );
          expect(await charactersDao.getAllCharacters(), [a, b]);
          final c = await charactersDao.createCharacter(
            userAccount: userAccount2,
            name: 'C',
          );
          expect(await charactersDao.getAllCharacters(), [a, b, c]);
          final d = await charactersDao.createCharacter(
            userAccount: userAccount,
            name: 'D',
          );
          expect(await charactersDao.getAllCharacters(), [a, b, c, d]);
          await charactersDao.deleteCharacter(c);
          expect(await charactersDao.getAllCharacters(), [a, b, d]);
        },
      );
    },
  );
}
