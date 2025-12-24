import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

class CategoryTable extends Table {
  TextColumn get id => text().clientDefault(const Uuid().v4)();
  TextColumn get name => text()();
  DateTimeColumn get createdAt => dateTime().clientDefault(DateTime.now)();

  @override
  Set<Column> get primaryKey => {id};
}
