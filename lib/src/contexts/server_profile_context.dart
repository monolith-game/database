import 'package:drift/drift.dart';

import '../../database.dart';

/// The context for server profiles.
class ServerProfileContext {
  /// Create an instance.
  const ServerProfileContext({
    required this.serverProfile,
    this.securityContext,
    this.mainMenuMusic,
    this.menuSelectSound,
    this.menuActivateSound,
  });

  /// Load an instance from [result].
  ServerProfileContext.fromResults(
    final MonolithDatabase db,
    final TypedResult result,
  )   : serverProfile = result.readTable(db.serverProfiles),
        securityContext = result.readTableOrNull(
          db.serverSecurityContexts,
        ),
        mainMenuMusic = result.readTableOrNull(
          db.alias(
            db.sounds,
            db.serverProfiles.mainMenuMusicId.name,
          ),
        ),
        menuSelectSound = result.readTableOrNull(
          db.alias(
            db.sounds,
            db.serverProfiles.menuSelectSoundId.name,
          ),
        ),
        menuActivateSound = result.readTableOrNull(
          db.alias(
            db.sounds,
            db.serverProfiles.menuActivateSoundId.name,
          ),
        );

  /// The server profile to use.
  final ServerProfile serverProfile;

  /// The security context for [serverProfile].
  final ServerSecurityContext? securityContext;

  /// THe main menu music.
  final Sound? mainMenuMusic;

  /// The menu select sound.
  final Sound? menuSelectSound;

  /// The menu activate sound.
  final Sound? menuActivateSound;
}
