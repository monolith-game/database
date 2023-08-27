import 'dart:math';

import 'package:database/database.dart';
import 'package:database/extensions.dart';
import 'package:drift/drift.dart';
import 'package:test/test.dart';

import 'get_database.dart';

void main() {
  final database = getDatabase();
  final zonesDao = database.zonesDao;

  late final Zone zone;

  setUpAll(() async {
    zone = await zonesDao.createZone(name: 'Extensions Zone');
  });

  group(
    'RoomExtensions',
    () {
      final roomsDao = database.roomsDao;
      late Room room;

      setUp(() async {
        database.delete(database.rooms);
        room =
            await roomsDao.createRoom(zone: zone, name: 'Room Extensions Room');
      });

      test(
        '.getMaxCoordinates',
        () async {
          expect(room.maxCoordinates, Point(room.maxX, room.maxY));
          final r = await roomsDao.editRoom(
            room: room,
            companion: const RoomsCompanion(maxX: Value(1), maxY: Value(2)),
          );
          expect(r.maxCoordinates, Point(r.maxX, r.maxY));
        },
      );
    },
  );
}
