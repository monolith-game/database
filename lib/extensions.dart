import 'dart:math';

import 'src/database.dart';

/// Useful extensions for [Room]s.
extension RoomExtensions on Room {
  /// Returns the maximum possible coordinates.
  Point<int> get maxCoordinates => Point(maxX, maxY);
}
