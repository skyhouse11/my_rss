import 'package:drift/drift.dart';

class FeedTags extends Table {
  TextColumn get feedId =>
      text().customConstraint('REFERENCES feed_table(id) NOT NULL')();
  TextColumn get tagId => text().customConstraint('REFERENCES tag_table(id)')();

  @override
  Set<Column> get primaryKey => {feedId, tagId};
}
