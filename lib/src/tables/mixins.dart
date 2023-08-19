import 'package:drift/drift.dart';

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
