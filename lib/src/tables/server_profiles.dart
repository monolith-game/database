import 'package:drift/drift.dart';

import 'mixins.dart';
import 'server_security_contexts.dart';
import 'sounds.dart';

/// The server profiles table.
class ServerProfiles extends Table with IdMixin, NameMixin, UuidMixin {
  /// The ID of the main menu music.
  IntColumn get mainMenuMusicId => integer()
      .references(Sounds, #id, onDelete: KeyAction.setNull)
      .nullable()();

  /// The ID of the menu select sound.
  IntColumn get menuSelectSoundId => integer()
      .references(Sounds, #id, onDelete: KeyAction.setNull)
      .nullable()();

  /// The ID of the menu activate sound.
  IntColumn get menuActivateSoundId => integer()
      .references(Sounds, #id, onDelete: KeyAction.setNull)
      .nullable()();

  /// The port to listen on.
  IntColumn get port => integer().withDefault(const Constant(8080))();

  /// The host to bind on.
  TextColumn get host => text().withDefault(const Constant('0.0.0.0'))();

  /// The ID of the security context.
  IntColumn get securityContextId => integer()
      .references(ServerSecurityContexts, #id, onDelete: KeyAction.setNull)
      .nullable()();
}
