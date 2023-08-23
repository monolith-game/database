import 'dart:io';
import 'dart:math';

import 'package:test/test.dart';

import '../../common.dart';
import '../../get_database.dart';

void main() {
  final random = Random();
  final database = getDatabase();
  final serverProfilesDao = database.serverProfilesDao;
  final serverSecurityContextsDao = database.serverSecurityContextsDao;
  final soundsDao = database.soundsDao;
  final utilsDao = database.utilsDao;

  group(
    'UtilsDao',
    () {
      test(
        '.getServerProfileContext',
        () async {
          await runUntilCount(
            f: (final i) async {
              final securityContext = random.nextBool()
                  ? await serverSecurityContextsDao.createServerSecurityContext(
                      chainFile: File('fullchain$i.pem'),
                      keyFile: File('privkey$i.pem'),
                    )
                  : null;
              final mainMenuMusic = random.nextBool()
                  ? await soundsDao.createSound('main_music_$i.mp3')
                  : null;
              final menuSelectSound = random.nextBool()
                  ? await soundsDao.createSound('menu_select_$i.mp3')
                  : null;
              final menuActivateSound = random.nextBool()
                  ? await soundsDao.createSound('menu_activate$i.mp3')
                  : null;
              final profile = await serverProfilesDao.createServerProfile(
                name: 'Profile $i',
                host: '0.0.0.0',
                port: i,
                securityContext: securityContext,
                mainMenuMusic: mainMenuMusic,
                menuSelectSound: menuSelectSound,
                menuActivateSound: menuActivateSound,
              );
              final context =
                  await utilsDao.getServerProfileContext(profile.id);
              expect(context.mainMenuMusic, mainMenuMusic);
              expect(context.menuActivateSound, menuActivateSound);
              expect(context.menuSelectSound, menuSelectSound);
              expect(context.securityContext, securityContext);
              expect(context.serverProfile, profile);
            },
          );
        },
      );
    },
  );
}
