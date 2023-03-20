import 'package:wasabi_crossplatform/domain/models/tasks/abstract_tasks.dart';

abstract class AbstractTasksRepository {
  Future<AbstractTasks> fetchTasks({int page = 1});
}
