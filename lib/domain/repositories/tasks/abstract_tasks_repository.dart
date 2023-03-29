import 'package:wasabi_crossplatform/domain/models/auth/abstract_message.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_tasks.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_total_count.dart';

abstract class AbstractTasksRepository {
  Future<AbstractTasks> fetchTasks({int page = 1});

  Future<AbstractMessage> savedTask(AbstractTask task);

  Future<AbstractMessage> deletedTask(String id);

  Future<AbstractTotalCount> getTotalCount();
}
