import 'dart:io';

import 'package:test/test.dart';

import '../../get_database.dart';

void main() {
  final database = getDatabase();
  final serverProfilesDao = database.serverProfilesDao;
  final serverSecurityContextsDao = database.serverSecurityContextsDao;

  group(
    'ServerProfilesDao',
    () {
      test(
        '.createServerProfile',
        () async {
          final insecure = await serverProfilesDao.createServerProfile(
            name: 'Profile 1',
            host: '0.0.0.0',
            port: 8080,
          );
          expect(insecure.host, '0.0.0.0');
          expect(insecure.mainMenuMusicId, null);
          expect(insecure.menuActivateSoundId, null);
          expect(insecure.menuSelectSoundId, null);
          expect(insecure.name, 'Profile 1');
          expect(insecure.port, 8080);
          expect(insecure.securityContextId, null);
          final context =
              await serverSecurityContextsDao.createServerSecurityContext(
            chainFile: File('fullchain.pem'),
            keyFile: File('privkey.pem'),
          );
          final secure = await serverProfilesDao.createServerProfile(
            name: 'Profile 2',
            host: '127.0.0.1',
            port: 8743,
            securityContext: context,
          );
          expect(secure.host, '127.0.0.1');
          expect(secure.mainMenuMusicId, null);
          expect(secure.menuActivateSoundId, null);
          expect(secure.menuSelectSoundId, null);
          expect(secure.securityContextId, context.id);
        },
      );
    },
  );
}
