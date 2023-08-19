import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/characters.dart';

part 'characters_dao.g.dart';

/// The characters DAO.
@DriftAccessor(tables: [Characters])
class CharactersDao extends DatabaseAccessor<MonolithDatabase>
    with _$CharactersDaoMixin {
  /// Create an instance.
  CharactersDao(super.db);

  /// Create a new row.
  Future<Character> createCharacter({
    required final UserAccount userAccount,
    required final String name,
    final bool isAdmin = false,
  }) =>
      into(characters).insertReturning(
        CharactersCompanion(
          isAdmin: Value(isAdmin),
          name: Value(name),
          userAccountId: Value(userAccount.id),
        ),
      );

  /// Get all characters owned by [userAccount].
  Future<List<Character>> getCharacters(final UserAccount userAccount) async {
    final query = select(characters)
      ..where((final table) => table.userAccountId.equals(userAccount.id));
    return query.get();
  }

  /// Get all characters, regardless of user account.
  Future<List<Character>> getAllCharacters() => select(characters).get();

  /// Update [character].
  Future<Character> editCharacter({
    required final Character character,
    required final CharactersCompanion companion,
  }) async {
    final query = update(characters)
      ..where((final table) => table.id.equals(character.id));
    final rows = await query.writeReturning(companion);
    return rows.single;
  }

  /// Delete [character].
  Future<int> deleteCharacter(final Character character) => (delete(characters)
        ..where((final table) => table.id.equals(character.id)))
      .go();

  /// Get a single row by [id].
  Future<Character> getCharacter(final int id) =>
      (select(characters)..where((final table) => table.id.equals(id)))
          .getSingle();
}
