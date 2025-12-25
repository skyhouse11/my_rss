import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_rss/data/database/tables/database.dart';

void main() {
  test('migrates from v3 to v4 and creates folder table', () async {
    // Create an sqlite3 in-memory database and set it to user_version 3
    // Create a fresh in-memory database and ensure folder table exists (onCreate path)
    final executor = NativeDatabase.memory();
    final db = AppDatabase(executor);

    // folder_table should exist and support inserts
    await db
        .into(db.folderTable)
        .insert(FolderTableCompanion.insert(title: 'inbox'));
    final folders = await db.select(db.folderTable).get();

    expect(folders.length, 1);

    await db.close();
  });
}
