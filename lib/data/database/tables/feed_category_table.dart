import 'package:drift/drift.dart';

class FeedCategories extends Table {
  TextColumn get feedId =>
      text().customConstraint('REFERENCES feed_table(id)')();
  TextColumn get categoryId =>
      text().customConstraint('REFERENCES category_table(id)')();

  @override
  Set<Column> get primaryKey => {feedId, categoryId};
}
