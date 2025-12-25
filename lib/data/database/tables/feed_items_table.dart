import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

class FeedItemsTable extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get feedId =>
      text().customConstraint('REFERENCES feed_table(id)')();
  TextColumn get title => text()();
  TextColumn get url => text()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get publishedAt => dateTime().nullable()();
  BoolColumn get isRead => boolean().withDefault(const Constant(false))();
  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().clientDefault(DateTime.now)();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<String> get customConstraints => const [
    'CONSTRAINT feed_item_unique_feed_url UNIQUE (feed_id, url)',
  ];
}
