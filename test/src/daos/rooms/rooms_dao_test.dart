import 'package:database/database.dart';
import 'package:test/test.dart';

import '../../../get_database.dart';

void main() {
  final database = getDatabase();

  final zonesDao = database.zonesDao;

  final roomsDao = database.roomsDao;

  late final Zone zone;

  late Room room;

  setUpAll(() async {
    zone = await zonesDao.createZone(name: 'Zone');
  });

  setUp(() async {
    await database.delete(database.rooms).go();
    room = await roomsDao.createRoom(zone: zone, name: 'Test Room');
  });

  group(
    'RoomsDao',
    () {
      test(
        '.getRoomsInZone',
        () async {
          expect(await roomsDao.getRoomsInZone(zone), [room]);
        },
      );
    },
  );
}
