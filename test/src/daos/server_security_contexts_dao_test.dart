import 'dart:io';

import 'package:test/test.dart';

import '../../get_database.dart';

void main() {
  final database = getDatabase();

  final serverSecurityContextsDao = database.serverSecurityContextsDao;

  group(
    'ServerSecurityContextsDao',
    () {
      test(
        '.createServerSecurityContext',
        () async {
          final context =
              await serverSecurityContextsDao.createServerSecurityContext(
            chainFile: File('fullchain.pem'),
            keyFile: File('privkey.pem'),
          );
          expect(context.chainFilePath, 'fullchain.pem');
          expect(context.chainPassword, null);
          expect(context.keyFilePath, 'privkey.pem');
          expect(context.keyPassword, null);
          final newContext =
              await serverSecurityContextsDao.createServerSecurityContext(
            chainFile: File(context.chainFilePath),
            keyFile: File(context.keyFilePath),
            chainPassword: 'chain_password',
            keyPassword: 'key_password',
          );
          expect(newContext.chainFilePath, context.chainFilePath);
          expect(newContext.chainPassword, 'chain_password');
          expect(newContext.keyFilePath, context.keyFilePath);
          expect(newContext.keyPassword, 'key_password');
        },
      );
    },
  );
}
