import 'package:drift/drift.dart';

import '../mixins.dart';

/// The sounds table.
class Sounds extends Table with IdMixin, UuidMixin {
  /// The path to the sound.
  TextColumn get path => text()();

  /// The gain of the sound.
  RealColumn get gain => real().withDefault(const Constant(0.7))();
}
