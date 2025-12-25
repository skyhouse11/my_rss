import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_rss/data/database/tables/database.dart';

void main() {
  test('create folder and move feed into it', () async {
    final executor = NativeDatabase.memory();
    final db = AppDatabase(executor);

    // Create folder
    await db.folderDao.createFolder('My Folder');
    final folders = await db.folderDao.getAllFolders();
    expect(folders, isNotEmpty);

    // Create feed and move it into folder
    final folderId = folders.first.id;

    // Insert a feed and ensure it exists
    await db
        .into(db.feedTable)
        .insert(
          FeedTableCompanion.insert(
            url: 'https://example.com',
            title: const Value('title'),
          ),
        );
    final allFeeds = await db.select(db.feedTable).get();
    expect(allFeeds.length, 1);
    final feedId = allFeeds.first.id;

    await db.folderDao.moveFeedToFolder(feedId, folderId);

    final feeds = await db.folderDao.getFeedsForFolder(folderId);
    expect(feeds.length, 1);

    await db.close();
  });
}
