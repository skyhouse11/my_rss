import 'package:drift/drift.dart';
import 'package:my_rss/data/database/tables/database.dart';
import 'package:my_rss/data/database/tables/feed_table.dart';
import 'package:my_rss/data/database/tables/feed_tag_table.dart';
import 'package:my_rss/data/database/tables/tag_table.dart';

part 'tag_dao.g.dart';

@DriftAccessor(tables: [TagTable, FeedTags, FeedTable])
class TagDao extends DatabaseAccessor<AppDatabase> with _$TagDaoMixin {
  TagDao(AppDatabase db) : super(db);

  Future<List<TagTableData>> getAllTags() => select(tagTable).get();

  Future<void> createTag(String name) async {
    await into(tagTable).insert(TagTableCompanion.insert(name: name));
  }

  Future<void> addTagToFeed(String feedId, String tagId) async {
    await into(
      feedTags,
    ).insert(FeedTagsCompanion(feedId: Value(feedId), tagId: Value(tagId)));
  }

  Future<void> removeTagFromFeed(String feedId, String tagId) async {
    await (delete(
      feedTags,
    )..where((t) => t.feedId.equals(feedId) & t.tagId.equals(tagId))).go();
  }

  Future<List<TagTableData>> getTagsForFeed(String feedId) async {
    final query = select(tagTable).join([
      innerJoin(feedTags, feedTags.tagId.equalsExp(tagTable.id)),
    ])..where(feedTags.feedId.equals(feedId));

    final rows = await query.get();
    return rows.map((r) => r.readTable(tagTable)).toList();
  }

  Future<TagTableData?> findByName(String name) async => (select(
    tagTable,
  )..where((t) => t.name.equals(name))).getSingleOrNull();

  Future<TagTableData> getOrCreateByName(String name) async {
    final existing = await findByName(name);
    if (existing != null) return existing;
    final id = await into(
      tagTable,
    ).insert(TagTableCompanion.insert(name: name));
    return (select(tagTable)..where((t) => t.id.equals('$id'))).getSingle();
  }

  Future<List<FeedTableData>> getFeedsForTag(String tagId) async {
    final q = select(feedTable).join([
      innerJoin(feedTags, feedTags.feedId.equalsExp(feedTable.id)),
    ])..where(feedTags.tagId.equals(tagId));
    final rows = await q.get();
    return rows.map((r) => r.readTable(feedTable)).toList();
  }
}
