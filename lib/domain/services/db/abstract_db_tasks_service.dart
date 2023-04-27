import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';

abstract class AbstractDBTasksService {
  void close();

  Future<List<AbstractTask>> getAllTasksDB();

  Future<void> insertTaskDB(AbstractTask task);

  Future<void> deleteTaskDB(String id);

  Future<void> deleteAll();

  Stream<List<AbstractTask>> onChangedTasksDB();
}
