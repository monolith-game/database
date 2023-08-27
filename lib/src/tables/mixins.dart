import 'package:drift/drift.dart';

import '../../constants.dart';

/// Add a primary key [id] column.
mixin IdMixin on Table {
  /// The primary key.
  IntColumn get id => integer().autoIncrement()();
}

/// Add a [name] column.
mixin NameMixin on Table {
  /// The name of something.
  TextColumn get name => text()();
}

/// Add a [uuid] column.
mixin UuidMixin on Table {
  /// A unique UUID to remove the reliance on sequential IDs in the API.
  TextColumn get uuid =>
      text().withLength(min: 36, max: 36).clientDefault(uuidGenerator.v4)();
}
