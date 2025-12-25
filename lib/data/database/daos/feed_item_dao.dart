import 'package:drift/drift.dart';
import 'package:my_rss/data/database/tables/database.dart';
import 'package:my_rss/data/database/tables/feed_items_table.dart';

part 'feed_item_dao.g.dart';

@DriftAccessor(tables: [FeedItemsTable])
class FeedItemDao extends DatabaseAccessor<AppDatabase>
    with _$FeedItemDaoMixin {
  FeedItemDao(AppDatabase db) : super(db);

  Future<void> upsertItem(FeedItemsTableCompanion c) async {
    await into(feedItemsTable).insert(c, mode: InsertMode.insertOrReplace);
  }

  Future<void> upsertItems(List<FeedItemsTableCompanion> items) async {
    await transaction(() async {
      for (final c in items) {
        await into(feedItemsTable).insert(c, mode: InsertMode.insertOrReplace);
      }
    });
  }

  Future<FeedItemsTableData?> getItemByUrl(String feedId, String url) {
    return (select(feedItemsTable)
          ..where((tbl) => tbl.feedId.equals(feedId) & tbl.url.equals(url)))
        .getSingleOrNull();
  }

  Future<List<FeedItemsTableData>> getItemsForFeed(
    String feedId, {
    int? limit,
    int? offset,
  }) {
    final s =
        (select(feedItemsTable)
            ..where((tbl) => tbl.feedId.equals(feedId))
            ..orderBy(
              [
                (t) => OrderingTerm(
                  expression: t.publishedAt,
                  mode: OrderingMode.desc,
                ),
              ],
            ))
          ..limit(limit ?? 100, offset: offset ?? 0);

    return s.get();
  }

  UpdateStatement<$FeedItemsTableTable, FeedItemsTableData> findItemById(
    String id,
  ) => (update(feedItemsTable)..where((tbl) => tbl.id.equals(id)));

  Future<void> markRead(String id, {bool read = true}) async =>
      findItemById(id).write(
        FeedItemsTableCompanion(
          isRead: Value(read),
        ),
      );

  Future<void> markFavorite(String id, {bool favorite = true}) async =>
      findItemById(id).write(
        FeedItemsTableCompanion(
          isFavorite: Value(favorite),
        ),
      );

  Future<void> deleteItemsForFeed(String feedId) async =>
      (delete(feedItemsTable)..where((tbl) => tbl.feedId.equals(feedId))).go();
}
