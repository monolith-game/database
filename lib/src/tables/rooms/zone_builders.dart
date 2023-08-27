import 'package:drift/drift.dart';

import '../mixins.dart';
import '../user_accounts/characters.dart';
import 'zones.dart';

/// The zone builders table.
class ZoneBuilders extends Table with IdMixin, UuidMixin {
  /// The ID of the zone this builder references.
  IntColumn get zoneId =>
      integer().references(Zones, #id, onDelete: KeyAction.cascade)();

  /// The ID of the character who can build on this zone.
  IntColumn get characterId =>
      integer().references(Characters, #id, onDelete: KeyAction.cascade)();
}
