import 'package:database/database.dart';
import 'package:test/test.dart';

import '../../../get_database.dart';

void main() {
  final database = getDatabase();
  final zonesDao = database.zonesDao;
  final userAccountsDao = database.userAccountsDao;
  final charactersDao = database.charactersDao;
  final zoneBuildersDao = database.zoneBuildersDao;

  late final UserAccount userAccount;
  late Character character;
  late final Zone zone;

  setUpAll(() async {
    userAccount = await userAccountsDao.createUserAccount(
      username: 'testing',
      password: 'password',
    );
    zone = await zonesDao.createZone(name: 'Test Zone');
  });

  setUp(() async {
    await database.delete(database.zoneBuilders).go();
    character = await charactersDao.createCharacter(
      userAccount: userAccount,
      name: 'Test Character',
    );
  });

  group(
    'ZoneBuildersDao',
    () {
      test(
        '.createZoneBuilder',
        () async {
          final builder = await zoneBuildersDao.createZoneBuilder(
            zone: zone,
            character: character,
          );
          expect(builder.characterId, character.id);
          expect(builder.zoneId, zone.id);
        },
      );

      test(
        '.getZoneBuilders',
        () async {
          final builder1 = await zoneBuildersDao.createZoneBuilder(
            zone: zone,
            character: character,
          );
          expect(await zoneBuildersDao.getZoneBuilders(zone), [builder1]);
          final userAccount2 = await userAccountsDao.createUserAccount(
            username: 'Another User',
            password: 'password',
          );
          final character2 = await charactersDao.createCharacter(
            userAccount: userAccount2,
            name: 'Another Character',
            isAdmin: true,
          );
          final builder2 = await zoneBuildersDao.createZoneBuilder(
            zone: zone,
            character: character2,
          );
          expect(
            await zoneBuildersDao.getZoneBuilders(zone),
            [builder1, builder2],
          );
        },
      );

      test(
        '.getExactZoneBuilder',
        () async {
          final builder = await zoneBuildersDao.createZoneBuilder(
            zone: zone,
            character: character,
          );
          expect(
            await zoneBuildersDao.getExactZoneBuilder(
              zone: zone,
              character: character,
            ),
            builder,
          );
          final character2 = await charactersDao.createCharacter(
            userAccount: userAccount,
            name: 'Third Character',
          );
          expect(
            await zoneBuildersDao.getExactZoneBuilder(
              zone: zone,
              character: character2,
            ),
            null,
          );
        },
      );
    },
  );
}
