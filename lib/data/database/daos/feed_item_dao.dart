import 'package:command_it/command_it.dart';
import 'package:drift/drift.dart';
import 'package:my_rss/data/database/tables/database.dart';
import 'package:my_rss/data/database/tables/feed_items_table.dart';

part 'feed_item_dao.g.dart';

typedef FeedItemQuery = ({String feedId, String url});
typedef FeedItemsForFeedQuery = ({String feedId, int? limit, int? offset});
typedef MarkItemQuery = ({String id, bool read});
typedef MarkItemFavoriteQuery = ({String id, bool favorite});

@DriftAccessor(tables: [FeedItemsTable])
class FeedItemDao extends DatabaseAccessor<AppDatabase>
    with _$FeedItemDaoMixin {
  FeedItemDao(AppDatabase db) : super(db);

  late final upsertItemCommand =
      Command.createAsyncNoResult<FeedItemsTableCompanion>(
        (c) async =>
            into(feedItemsTable).insert(c, mode: InsertMode.insertOrReplace),
      );

  late final upsertItemsCommand =
      Command.createAsyncNoResult<List<FeedItemsTableCompanion>>(
        (items) async => transaction(() async {
          for (final c in items) {
            await into(
              feedItemsTable,
            ).insert(c, mode: InsertMode.insertOrReplace);
          }
        }),
      );

  late final getItemByUrlCommand = Command.createAsync(
    (FeedItemQuery query) async =>
        (select(feedItemsTable)..where(
              (tbl) =>
                  tbl.feedId.equals(query.feedId) & tbl.url.equals(query.url),
            ))
            .getSingleOrNull(),
    initialValue: null,
  );

  late final getItemsForFeedCommand = Command.createAsync(
    (FeedItemsForFeedQuery query) async {
      final s =
          (select(feedItemsTable)
              ..where((tbl) => tbl.feedId.equals(query.feedId))
              ..orderBy(
                [
                  (t) => OrderingTerm(
                    expression: t.publishedAt,
                    mode: OrderingMode.desc,
                  ),
                ],
              ))
            ..limit(query.limit ?? 100, offset: query.offset ?? 0);

      return s.get();
    },
    initialValue: <FeedItemsTableData>[],
  );

  late final markReadCommand = Command.createAsyncNoResult<MarkItemQuery>(
    (query) async =>
        (update(feedItemsTable)..where((tbl) => tbl.id.equals(query.id))).write(
          FeedItemsTableCompanion(
            isRead: Value(query.read),
          ),
        ),
  );

  late final markFavoriteCommand =
      Command.createAsyncNoResult<MarkItemFavoriteQuery>(
        (query) async =>
            (update(
              feedItemsTable,
            )..where((tbl) => tbl.id.equals(query.id))).write(
              FeedItemsTableCompanion(
                isFavorite: Value(query.favorite),
              ),
            ),
      );

  late final deleteItemsForFeedCommand = Command.createAsyncNoResult<String>(
    (feedId) async => (delete(
      feedItemsTable,
    )..where((tbl) => tbl.feedId.equals(feedId))).go(),
  );
}
