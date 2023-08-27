import 'package:drift/drift.dart';

import '../../database.dart';
import '../../tables/rooms/zones.dart';

part 'zones_dao.g.dart';

/// The zones DAO.
@DriftAccessor(tables: [Zones])
class ZonesDao extends DatabaseAccessor<MonolithDatabase> with _$ZonesDaoMixin {
  /// Create an instance.
  ZonesDao(super.db);

  /// Create a new row.
  Future<Zone> createZone({
    required final String name,
    final Sound? zoneMusic,
  }) =>
      into(zones).insertReturning(
        ZonesCompanion(
          name: Value(name),
          zoneMusicId: Value(zoneMusic?.id),
        ),
      );

  /// Update [zone].
  Future<Zone> editZone({
    required final Zone zone,
    required final ZonesCompanion companion,
  }) async {
    final query = update(zones)
      ..where((final table) => table.id.equals(zone.id));
    final rows = await query.writeReturning(companion);
    return rows.single;
  }

  /// Delete [zone].
  Future<int> deleteZone(final Zone zone) =>
      (delete(zones)..where((final table) => table.id.equals(zone.id))).go();

  /// Get a single row by [id].
  Future<Zone> getZone(final int id) =>
      (select(zones)..where((final table) => table.id.equals(id))).getSingle();
}
