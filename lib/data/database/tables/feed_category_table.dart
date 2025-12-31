import 'package:drift/drift.dart';

class FeedCategories extends Table {
  TextColumn get feedId =>
      text().customConstraint('REFERENCES feed_table(id) NOT NULL')();
  TextColumn get categoryId =>
      text().customConstraint('REFERENCES category_table(id) NOT NULL')();

  @override
  Set<Column> get primaryKey => {feedId, categoryId};
}
