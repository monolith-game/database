import 'package:drift/drift.dart';

import '../mixins.dart';
import '../sounds/sounds.dart';
import 'zones.dart';

/// The rooms table.
class Rooms extends Table with IdMixin, UuidMixin, NameMixin, AmbianceMixin {
  /// The ID of the zone this room belongs to.
  IntColumn get zoneId =>
      integer().references(Zones, #id, onDelete: KeyAction.restrict)();

  /// The maximum x coordinate.
  IntColumn get maxX => integer().withDefault(const Constant(100))();

  /// The maximum y coordinate.
  IntColumn get maxY => integer().withDefault(const Constant(100))();

  /// The ID of the wall sound.
  IntColumn get wallSoundId => integer()
      .references(Sounds, #id, onDelete: KeyAction.setNull)
      .nullable()();

  /// The ID of the default footstep sound.
  IntColumn get defaultFootstepSoundId => integer()
      .references(Sounds, #id, onDelete: KeyAction.setNull)
      .nullable()();
}
