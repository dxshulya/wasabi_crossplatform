import 'package:drift/drift.dart';
import 'package:wasabi_crossplatform/data/db/database.dart';
import 'package:wasabi_crossplatform/data/mappers/db/db_data_mapper.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';
import 'package:wasabi_crossplatform/domain/services/db/abstract_db_tasks_service.dart';

class DBTasksService implements AbstractDBTasksService {
  final Database _database = Database();

  @override
  void close() {
    _database.close();
  }

  @override
  Future<List<AbstractTask>> getAllTasksDB() async {
    var tasksDB = await _database.select(_database.taskTable).get();

    return tasksDB
        .map((TaskTableData taskTableData) => taskTableData.toDomain())
        .toList();
  }

  @override
  Future<void> insertTaskDB(AbstractTask task) async {
    await _database.into(_database.taskTable).insert(
          task.toDatabase(),
          mode: InsertMode.insertOrReplace,
        );
  }

  @override
  Future<void> deleteTaskDB(String id) async {
    await (_database.delete(_database.taskTable)
          ..where((characterTable) => characterTable.id.equals(id)))
        .go();
  }

  @override
  Future<void> deleteAll() async {
    await _database.delete(_database.taskTable).go();
  }

  @override
  Stream<List<AbstractTask>> onChangedTasksDB() {
    return (_database.select(_database.taskTable))
        .map((TaskTableData taskTableData) => taskTableData.toDomain())
        .watch();
  }
}
