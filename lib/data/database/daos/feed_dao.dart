import 'package:command_it/command_it.dart';
import 'package:drift/drift.dart';
import 'package:my_rss/data/database/tables/database.dart';
import 'package:my_rss/data/database/tables/feed_table.dart';

part 'feed_dao.g.dart';

typedef CreateFeedData = ({
  String url,
  String? title,
  String? description,
  String? folderId,
});
typedef UpdateFeedData = ({
  String id,
  String? title,
  String? description,
  String? folderId,
  bool? autoFetch,
});

@DriftAccessor(tables: [FeedTable])
class FeedDao extends DatabaseAccessor<AppDatabase> with _$FeedDaoMixin {
  FeedDao(AppDatabase db) : super(db);

  late final getAllFeedsCommand = Command.createAsyncNoParam(
    () async => select(feedTable).get(),
    initialValue: <FeedTableData>[],
  );

  late final getFeedByIdCommand = Command.createAsync(
    (String id) async =>
        (select(feedTable)..where((f) => f.id.equals(id))).getSingleOrNull(),
    initialValue: null,
  );

  late final createFeedCommand = Command.createAsyncNoResult<CreateFeedData>(
    (data) async => into(feedTable).insert(
      FeedTableCompanion(
        url: Value(data.url),
        title: Value(data.title),
        description: Value(data.description),
        folderId: Value(data.folderId),
      ),
    ),
  );

  late final updateFeedCommand = Command.createAsyncNoResult<UpdateFeedData>(
    (data) async =>
        (update(feedTable)..where((f) => f.id.equals(data.id))).write(
          FeedTableCompanion(
            title: data.title != null
                ? Value(data.title)
                : const Value.absent(),
            description: data.description != null
                ? Value(data.description)
                : const Value.absent(),
            folderId: data.folderId != null
                ? Value(data.folderId)
                : const Value.absent(),
            autoFetch: data.autoFetch != null
                ? Value(data.autoFetch!)
                : const Value.absent(),
          ),
        ),
  );

  late final deleteFeedCommand = Command.createAsyncNoResult<String>(
    (id) async => (delete(feedTable)..where((f) => f.id.equals(id))).go(),
  );

  late final getFeedByUrlCommand = Command.createAsync(
    (String url) async =>
        (select(feedTable)..where((f) => f.url.equals(url))).getSingleOrNull(),
    initialValue: null,
  );
}
