import 'dart:io';

import 'package:test/test.dart';

import '../../get_database.dart';

void main() {
  final database = getDatabase();
  final serverProfilesDao = database.serverProfilesDao;
  final serverSecurityContextsDao = database.serverSecurityContextsDao;
  final utilsDao = database.utilsDao;

  group(
    'UtilsDao',
    () {
      test(
        '.getServerProfileContext',
        () async {
          final insecure = await serverProfilesDao.createServerProfile(
            name: 'Test',
            host: '0.0.0.0',
            port: 8080,
          );
          var context = await utilsDao.getServerProfileContext(insecure.id);
          expect(insecure.securityContextId, null);
          expect(context.serverProfile, insecure);
          final securityContext =
              await serverSecurityContextsDao.createServerSecurityContext(
            chainFile: File('fullchain.pem'),
            keyFile: File('privkey.pem'),
          );
          final secure = await serverProfilesDao.createServerProfile(
            name: 'Secure',
            host: '0.0.0.0',
            port: 8080,
            securityContext: securityContext,
          );
          context = await utilsDao.getServerProfileContext(secure.id);
          expect(context.securityContext, securityContext);
          expect(context.serverProfile, secure);
        },
      );
    },
  );
}
