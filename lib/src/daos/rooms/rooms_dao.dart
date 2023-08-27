import 'package:drift/drift.dart';

import '../../database.dart';
import '../../tables/rooms/rooms.dart';

part 'rooms_dao.g.dart';

/// The rooms DAO.
@DriftAccessor(tables: [Rooms])
class RoomsDao extends DatabaseAccessor<MonolithDatabase> with _$RoomsDaoMixin {
  /// Create an instance.
  RoomsDao(super.db);

  /// Create a new row.
  Future<Room> createRoom({
    required final Zone zone,
    required final String name,
    final Sound? ambiance,
  }) =>
      into(rooms).insertReturning(
        RoomsCompanion(
          ambianceId: Value(ambiance?.id),
          name: Value(name),
          zoneId: Value(zone.id),
        ),
      );

  /// Update [room].
  Future<Room> editRoom({
    required final Room room,
    required final RoomsCompanion companion,
  }) async {
    final query = update(rooms)
      ..where((final table) => table.id.equals(room.id));
    final rows = await query.writeReturning(companion);
    return rows.single;
  }

  /// Delete [room].
  Future<int> deleteRoom(final Room room) =>
      (delete(rooms)..where((final table) => table.id.equals(room.id))).go();

  /// Get a single row by [id].
  Future<Room> getRoom(final int id) =>
      (select(rooms)..where((final table) => table.id.equals(id))).getSingle();

  /// Get the rooms in [zone].
  Future<List<Room>> getRoomsInZone(final Zone zone) async =>
      (select(rooms)..where((final table) => table.zoneId.equals(zone.id)))
          .get();
}
