import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_tasks.dart';

class BaseTasks implements AbstractTasks {
  const BaseTasks({required List<AbstractTask> tasks}) : _tasks = tasks;

  BaseTasks.empty() : this(tasks: []);

  @override
  List<AbstractTask> get tasks => _tasks;
  final List<AbstractTask> _tasks;
}
