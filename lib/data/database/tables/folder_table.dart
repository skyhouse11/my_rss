import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

class FolderTable extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get title => text()();
  TextColumn get parentId => text().nullable()();
  DateTimeColumn get createdAt => dateTime().clientDefault(DateTime.now)();

  @override
  Set<Column> get primaryKey => {id};
}
