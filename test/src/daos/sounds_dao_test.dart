import 'package:test/test.dart';

import '../../get_database.dart';

void main() {
  final database = getDatabase();
  final soundsDao = database.soundsDao;

  group(
    'SoundsDao',
    () {
      test(
        '.createSound',
        () async {
          final sound = await soundsDao.createSound('sound.mp3');
          expect(sound.gain, 0.7);
          expect(sound.path, 'sound.mp3');
        },
      );
    },
  );
}
