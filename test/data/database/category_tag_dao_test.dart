import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_rss/data/database/tables/database.dart';

void main() {
  test(
    'getOrCreateByName for category returns same UUID on repeated calls',
    () async {
      final db = AppDatabase(NativeDatabase.memory());

      final first = await db.categoryDao.getOrCreateByName('news');
      final second = await db.categoryDao.getOrCreateByName('news');

      expect(first.id, equals(second.id));
      // basic UUID format check (contains dashes and length 36)
      expect(first.id.length, 36);
      expect(first.id.contains('-'), isTrue);

      final rows = await db.select(db.categoryTable).get();
      expect(rows.length, 1);

      await db.close();
    },
  );

  test(
    'getOrCreateByName for tag returns same UUID on repeated calls',
    () async {
      final db = AppDatabase(NativeDatabase.memory());

      final first = await db.tagDao.getOrCreateByName('flutter');
      final second = await db.tagDao.getOrCreateByName('flutter');

      expect(first.id, equals(second.id));
      expect(first.id.length, 36);
      expect(first.id.contains('-'), isTrue);

      final rows = await db.select(db.tagTable).get();
      expect(rows.length, 1);

      await db.close();
    },
  );
}
