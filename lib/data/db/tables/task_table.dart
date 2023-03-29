import 'package:drift/drift.dart';

class TaskTable extends Table {
  @override
  Set<Column> get primaryKey => {id};

  TextColumn get id => text()();

  TextColumn get formula => text()();

  TextColumn get task => text()();

  TextColumn get answer => text()();
}
