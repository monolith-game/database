import 'package:drift/drift.dart';

import '../mixins.dart';
import 'zones.dart';

/// The rooms table.
class Rooms extends Table with IdMixin, UuidMixin, NameMixin, AmbianceMixin {
  /// The ID of the zone this room belongs to.
  IntColumn get zoneId =>
      integer().references(Zones, #id, onDelete: KeyAction.restrict)();
}
