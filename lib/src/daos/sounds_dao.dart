import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/sounds.dart';

part 'sounds_dao.g.dart';

/// The sounds DAO.
@DriftAccessor(tables: [Sounds])
class SoundsDao extends DatabaseAccessor<MonolithDatabase>
    with _$SoundsDaoMixin {
  /// Create an instance.
  SoundsDao(super.db);

  /// Create a new row.
  Future<Sound> createSound(final String path) =>
      into(sounds).insertReturning(SoundsCompanion(path: Value(path)));

  /// Update [sound].
  Future<Sound> editSound({
    required final Sound sound,
    required final SoundsCompanion companion,
  }) async {
    final query = update(sounds)
      ..where((final table) => table.id.equals(sound.id));
    final rows = await query.writeReturning(companion);
    return rows.single;
  }

  /// Delete [sound].
  Future<int> deleteSound(final Sound sound) =>
      (delete(sounds)..where((final table) => table.id.equals(sound.id))).go();

  /// Get a single row by [id].
  Future<Sound> getSound(final int id) =>
      (select(sounds)..where((final table) => table.id.equals(id))).getSingle();
}
