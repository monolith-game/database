import 'dart:ffi';
import 'dart:io';

import 'package:database/database.dart';
import 'package:sqlite3/open.dart';
import 'package:test/test.dart';

DynamicLibrary _openOnLinux() {
  final workingDirectory = Directory.current.path;
  return DynamicLibrary.open('$workingDirectory/sqlite3.so');
}

DynamicLibrary _openOnWindows() => DynamicLibrary.open('sqlite3.dll');

/// Do initial setup and get a database.
MonolithDatabase getDatabase() {
  open
    ..overrideFor(OperatingSystem.windows, _openOnWindows)
    ..overrideFor(OperatingSystem.linux, _openOnLinux);
  final db = MonolithDatabase();
  addTearDown(db.close);
  return db;
}
