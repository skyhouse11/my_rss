import 'package:drift/drift.dart';
import 'package:my_rss/data/database/tables/database.dart';
import 'package:my_rss/data/database/tables/feed_table.dart';

part 'feed_dao.g.dart';

@DriftAccessor(tables: [FeedTable])
class FeedDao extends DatabaseAccessor<AppDatabase> with _$FeedDaoMixin {
  FeedDao(AppDatabase db) : super(db);

  Future<List<FeedTableData>> getAllFeeds() => select(feedTable).get();

  Future<FeedTableData?> getFeedById(String id) =>
      (select(feedTable)..where((f) => f.id.equals(id))).getSingleOrNull();

  Future<void> createFeed({
    required String url,
    String? title,
    String? description,
    String? folderId,
  }) async => into(feedTable).insert(
    FeedTableCompanion(
      url: Value(url),
      title: Value(title),
      description: Value(description),
      folderId: Value(folderId),
    ),
  );

  Future<void> updateFeed({
    required String id,
    String? title,
    String? description,
    String? folderId,
    bool? autoFetch,
  }) async => (update(feedTable)..where((f) => f.id.equals(id))).write(
    FeedTableCompanion(
      title: title != null ? Value(title) : const Value.absent(),
      description: description != null
          ? Value(description)
          : const Value.absent(),
      folderId: folderId != null ? Value(folderId) : const Value.absent(),
      autoFetch: autoFetch != null ? Value(autoFetch) : const Value.absent(),
    ),
  );

  Future<void> deleteFeed(String id) =>
      (delete(feedTable)..where((f) => f.id.equals(id))).go();

  Future<FeedTableData?> getFeedByUrl(String url) =>
      (select(feedTable)..where((f) => f.url.equals(url))).getSingleOrNull();
}
