import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

class FeedTable extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get url => text()();
  TextColumn get title => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get folderId => text().nullable()();
  BoolColumn get autoFetch => boolean().withDefault(const Constant(true))();

  DateTimeColumn get lastUpdatedAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().clientDefault(DateTime.now)();

  @override
  Set<Column> get primaryKey => {id};
}
