import 'package:command_it/command_it.dart';
import 'package:drift/drift.dart';
import 'package:my_rss/data/database/tables/category_table.dart';
import 'package:my_rss/data/database/tables/database.dart';
import 'package:my_rss/data/database/tables/feed_category_table.dart';
import 'package:my_rss/data/database/tables/feed_table.dart';
import 'package:uuid/uuid.dart';

part 'category_dao.g.dart';

typedef CategoryInFeed = ({String feedId, String categoryId});

@DriftAccessor(tables: [CategoryTable, FeedCategories, FeedTable])
class CategoryDao extends DatabaseAccessor<AppDatabase>
    with _$CategoryDaoMixin {
  CategoryDao(AppDatabase db) : super(db);

  late final getAllCategoriesCommand = Command.createAsyncNoParam(
    () async => select(categoryTable).get(),
    initialValue: <CategoryTableData>[],
  );

  late final createCategoryCommand = Command.createAsyncNoResult<String>(
    (name) => into(
      categoryTable,
    ).insert(CategoryTableCompanion.insert(name: name)),
  );

  late final addCategoryToFeedCommand = Command.createAsyncNoResult(
    (CategoryInFeed data) async => into(feedCategories).insert(
      FeedCategoriesCompanion(
        feedId: Value(data.feedId),
        categoryId: Value(data.categoryId),
      ),
    ),
  );

  late final removeCategoryFromFeed = Command.createAsyncNoResult(
    (CategoryInFeed data) async {
      final query = delete(feedCategories)
        ..where(
          (t) =>
              t.feedId.equals(data.feedId) &
              t.categoryId.equals(data.categoryId),
        );

      await query.go();
    },
  );

  late final getCategoriesForFeedCommand = Command.createAsync(
    (String feedId) async {
      final query = select(categoryTable).join([
        innerJoin(
          feedCategories,
          feedCategories.categoryId.equalsExp(categoryTable.id),
        ),
      ])..where(feedCategories.feedId.equals(feedId));

      final rows = await query.get();

      return rows.map((r) => r.readTable(categoryTable)).toList();
    },
    initialValue: <CategoryTableData>[],
  );

  late final findByNameCommand = Command.createAsync(
    (String name) async {
      final query = select(categoryTable)..where((t) => t.name.equals(name));
      final row = await query.getSingleOrNull();
      return row;
    },
    initialValue: null,
  );

  late final getOrCreateByNameCommand = Command.createAsync(
    (String name) async {
      final existing = await findByNameCommand.runAsync(name);
      if (existing != null) return existing;
      final id = const Uuid().v4();
      await into(categoryTable).insert(
        CategoryTableCompanion(id: Value(id), name: Value(name)),
      );
      return (select(
        categoryTable,
      )..where((t) => t.id.equals(id))).getSingle();
    },
    initialValue: null,
  );

  late final getFeedsForCategoryCommand = Command.createAsync(
    (String categoryId) async {
      final q = select(feedTable).join([
        innerJoin(
          feedCategories,
          feedCategories.feedId.equalsExp(feedTable.id),
        ),
      ])..where(feedCategories.categoryId.equals(categoryId));
      final rows = await q.get();
      return rows.map((r) => r.readTable(feedTable)).toList();
    },
    initialValue: <FeedTableData>[],
  );
}
