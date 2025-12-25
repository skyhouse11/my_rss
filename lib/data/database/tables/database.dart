import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:my_rss/data/database/daos/category_dao.dart';
import 'package:my_rss/data/database/daos/feed_item_dao.dart';
import 'package:my_rss/data/database/daos/folder_dao.dart';
import 'package:my_rss/data/database/daos/tag_dao.dart';
import 'package:my_rss/data/database/tables/category_table.dart';
import 'package:my_rss/data/database/tables/feed_category_table.dart';
import 'package:my_rss/data/database/tables/feed_items_table.dart';
import 'package:my_rss/data/database/tables/feed_table.dart';
import 'package:my_rss/data/database/tables/feed_tag_table.dart';
import 'package:my_rss/data/database/tables/folder_table.dart';
import 'package:my_rss/data/database/tables/tag_table.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    FeedTable,
    FolderTable,
    TagTable,
    FeedTags,
    CategoryTable,
    FeedCategories,
    FeedItemsTable,
  ],
  daos: [TagDao, CategoryDao, FeedItemDao, FolderDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) => m.createAll(),
    onUpgrade: (m, from, to) async {
      await m.createTable(tagTable);
      await m.createTable(feedTags);
      await m.createTable(categoryTable);
      await m.createTable(feedCategories);
      await m.createTable(feedItemsTable);
      await m.createTable(folderTable);
    },
  );

  static QueryExecutor _openConnection() => driftDatabase(
    name: 'my_database',
    native: const DriftNativeOptions(
      databaseDirectory: getApplicationSupportDirectory,
    ),
  );
}

extension AppDatabaseExtensions on AppDatabase {
  TagDao get tagDao => TagDao(this);
  CategoryDao get categoryDao => CategoryDao(this);
  FeedItemDao get feedItemDao => FeedItemDao(this);
  FolderDao get folderDao => FolderDao(this);

  // saveFeedWithTagsAndCategories
  Future<void> saveFeedWithTagsAndCategories(
    FeedTableData feed,
    List<String> tagNames,
    List<String> categoryNames,
  ) async {
    return transaction(() async {
      // Insert or update feed
      await into(feedTable).insertOnConflictUpdate(feed);

      // Handle tags
      for (final tagName in tagNames) {
        final tag = await tagDao.getOrCreateByName(tagName);
        await tagDao.addTagToFeed(feed.id, tag.id);
      }

      // Handle categories
      for (final categoryName in categoryNames) {
        final category = await categoryDao.getOrCreateByName(categoryName);
        await categoryDao.addCategoryToFeed(feed.id, category.id);
      }
    });
  }
}
