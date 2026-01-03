import 'package:drift/drift.dart';
import 'package:my_rss/data/database/tables/category_table.dart';
import 'package:my_rss/data/database/tables/database.dart';
import 'package:my_rss/data/database/tables/feed_category_table.dart';
import 'package:my_rss/data/database/tables/feed_table.dart';
import 'package:uuid/uuid.dart';

part 'category_dao.g.dart';

@DriftAccessor(tables: [CategoryTable, FeedCategories, FeedTable])
class CategoryDao extends DatabaseAccessor<AppDatabase>
    with _$CategoryDaoMixin {
  CategoryDao(AppDatabase db) : super(db);

  Future<List<CategoryTableData>> getAllCategories() =>
      select(categoryTable).get();

  Future<void> createCategory(String name) => into(
    categoryTable,
  ).insert(CategoryTableCompanion.insert(name: name));

  Future<void> addCategoryToFeed(String feedId, String categoryId) =>
      into(feedCategories).insert(
        FeedCategoriesCompanion(
          feedId: Value(feedId),
          categoryId: Value(categoryId),
        ),
      );

  Future<void> removeCategoryFromFeed(String feedId, String categoryId) async {
    final query = delete(feedCategories)
      ..where(
        (t) =>
            t.feedId.equals(feedId) &
            t.categoryId.equals(categoryId),
      );

    await query.go();
  }

  Future<List<CategoryTableData>> getCategoriesForFeed(String feedId) async {
    final query = select(categoryTable).join([
      innerJoin(
        feedCategories,
        feedCategories.categoryId.equalsExp(categoryTable.id),
      ),
    ])..where(feedCategories.feedId.equals(feedId));

    final rows = await query.get();

    return rows.map((r) => r.readTable(categoryTable)).toList();
  }

  Future<CategoryTableData?> findByName(String name) async {
    final query = select(categoryTable)..where((t) => t.name.equals(name));
    final row = await query.getSingleOrNull();
    return row;
  }

  Future<CategoryTableData> getOrCreateByName(String name) async {
    final existing = await findByName(name);
    if (existing != null) return existing;
    final id = const Uuid().v4();
    await into(categoryTable).insert(
      CategoryTableCompanion(id: Value(id), name: Value(name)),
    );
    return (select(
      categoryTable,
    )..where((t) => t.id.equals(id))).getSingle();
  }

  Future<List<FeedTableData>> getFeedsForCategory(String categoryId) async {
    final q = select(feedTable).join([
      innerJoin(
        feedCategories,
        feedCategories.feedId.equalsExp(feedTable.id),
      ),
    ])..where(feedCategories.categoryId.equals(categoryId));
    final rows = await q.get();
    return rows.map((r) => r.readTable(feedTable)).toList();
  }
}
