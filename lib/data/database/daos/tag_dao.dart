import 'package:command_it/command_it.dart';
import 'package:drift/drift.dart';
import 'package:my_rss/data/database/tables/database.dart';
import 'package:my_rss/data/database/tables/feed_table.dart';
import 'package:my_rss/data/database/tables/feed_tag_table.dart';
import 'package:my_rss/data/database/tables/tag_table.dart';
import 'package:uuid/uuid.dart';

part 'tag_dao.g.dart';

typedef TagInFeed = ({String feedId, String tagId});

@DriftAccessor(tables: [TagTable, FeedTags, FeedTable])
class TagDao extends DatabaseAccessor<AppDatabase> with _$TagDaoMixin {
  TagDao(AppDatabase db) : super(db);

  late final getAllTagsCommand = Command.createAsyncNoParam(
    () async => select(tagTable).get(),
    initialValue: <TagTableData>[],
  );

  late final createTagCommand = Command.createAsyncNoResult<String>(
    (name) async => into(tagTable).insert(TagTableCompanion.insert(name: name)),
  );

  late final addTagToFeedCommand = Command.createAsyncNoResult<TagInFeed>(
    (data) async => into(feedTags).insert(
      FeedTagsCompanion(feedId: Value(data.feedId), tagId: Value(data.tagId)),
    ),
  );

  late final removeTagFromFeedCommand = Command.createAsyncNoResult<TagInFeed>(
    (data) async => (delete(feedTags)
          ..where((t) => t.feedId.equals(data.feedId) & t.tagId.equals(data.tagId)))
        .go(),
  );

  late final getTagsForFeedCommand = Command.createAsync(
    (String feedId) async {
      final query = select(tagTable).join([
        innerJoin(feedTags, feedTags.tagId.equalsExp(tagTable.id)),
      ])..where(feedTags.feedId.equals(feedId));

      final rows = await query.get();
      return rows.map((r) => r.readTable(tagTable)).toList();
    },
    initialValue: <TagTableData>[],
  );

  late final findByNameCommand = Command.createAsync(
    (String name) async =>
        (select(tagTable)..where((t) => t.name.equals(name))).getSingleOrNull(),
    initialValue: null,
  );

  late final getOrCreateByNameCommand = Command.createAsync(
    (String name) async {
      final existing = await findByNameCommand.runAsync(name);
      if (existing != null) return existing;
      final id = const Uuid().v4();
      await into(tagTable)
          .insert(TagTableCompanion(id: Value(id), name: Value(name)));
      return (select(tagTable)..where((t) => t.id.equals(id))).getSingle();
    },
    initialValue: null,
  );

  late final getFeedsForTagCommand = Command.createAsync(
    (String tagId) async {
      final q = select(feedTable).join([
        innerJoin(feedTags, feedTags.feedId.equalsExp(feedTable.id)),
      ])..where(feedTags.tagId.equals(tagId));
      final rows = await q.get();
      return rows.map((r) => r.readTable(feedTable)).toList();
    },
    initialValue: <FeedTableData>[],
  );
}
