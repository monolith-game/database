import 'package:drift/drift.dart';

import '../mixins.dart';
import '../sounds/sounds.dart';

/// The zones table.
class Zones extends Table with IdMixin, UuidMixin, NameMixin {
  /// The ID of the music for this zone.
  IntColumn get zoneMusicId => integer()
      .references(Sounds, #id, onDelete: KeyAction.setNull)
      .nullable()();
}
