import 'package:drift/drift.dart';

import '../../database.dart';
import '../../tables/rooms/zone_builders.dart';
import '../../tables/rooms/zones.dart';

part 'zone_builders_dao.g.dart';

/// The zone builders DAO.
@DriftAccessor(tables: [Zones, ZoneBuilders])
class ZoneBuildersDao extends DatabaseAccessor<MonolithDatabase>
    with _$ZoneBuildersDaoMixin {
  /// Create an instance.
  ZoneBuildersDao(super.db);

  /// Create a new row.
  Future<ZoneBuilder> createZoneBuilder({
    required final Zone zone,
    required final Character character,
  }) =>
      into(zoneBuilders).insertReturning(
        ZoneBuildersCompanion(
          zoneId: Value(zone.id),
          characterId: Value(character.id),
        ),
      );

  /// Update [zoneBuilder].
  Future<ZoneBuilder> editZoneBuilder({
    required final ZoneBuilder zoneBuilder,
    required final ZoneBuildersCompanion companion,
  }) async {
    final query = update(zoneBuilders)
      ..where((final table) => table.id.equals(zoneBuilder.id));
    final rows = await query.writeReturning(companion);
    return rows.single;
  }

  /// Delete [zoneBuilder].
  Future<int> deleteZoneBuilder(final ZoneBuilder zoneBuilder) =>
      (delete(zoneBuilders)
            ..where((final table) => table.id.equals(zoneBuilder.id)))
          .go();

  /// Get a single row by [id].
  Future<ZoneBuilder> getZoneBuilder(final int id) =>
      (select(zoneBuilders)..where((final table) => table.id.equals(id)))
          .getSingle();

  /// Get the builders for [zone].
  Future<List<ZoneBuilder>> getZoneBuilders(final Zone zone) async =>
      (select(zoneBuilders)
            ..where((final table) => table.zoneId.equals(zone.id)))
          .get();

  /// Get a builder that matches both [zone] and [character].
  Future<ZoneBuilder?> getExactZoneBuilder({
    required final Zone zone,
    required final Character character,
  }) async =>
      (select(zoneBuilders)
            ..where(
              (final table) =>
                  table.characterId.equals(character.id) &
                  table.zoneId.equals(zone.id),
            ))
          .getSingleOrNull();
}
