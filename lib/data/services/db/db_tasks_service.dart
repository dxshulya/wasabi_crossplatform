import 'package:drift/drift.dart';
import 'package:wasabi_crossplatform/data/db/database.dart';
import 'package:wasabi_crossplatform/data/mappers/db/db_data_mapper.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';

class DBTasksService {
  final Database _database = Database();

  void close() {
    _database.close();
  }

  Future<List<AbstractTask>> getAllTasksDB() async {
    var tasksDB = await _database.select(_database.taskTable).get();

    return tasksDB
        .map((TaskTableData taskTableData) => taskTableData.toDomain())
        .toList();
  }

  Future<void> insertTaskDB(AbstractTask task) async {
    await _database.into(_database.taskTable).insert(
          task.toDatabase(),
          mode: InsertMode.insertOrReplace,
        );
  }

  Future<void> deleteTaskDB(String id) async {
    await (_database.delete(_database.taskTable)
          ..where((characterTable) => characterTable.id.equals(id)))
        .go();
  }

  Stream<List<AbstractTask>> onChangedTasksDB() {
    return (_database.select(_database.taskTable))
        .map((TaskTableData taskTableData) => taskTableData.toDomain())
        .watch();
  }
}
