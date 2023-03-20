import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_tasks.dart';

class BaseTasks implements AbstractTasks {
  BaseTasks({required List<AbstractTask> tasks, required int totalCount})
      : _tasks = tasks,
        _totalCount = totalCount;

  BaseTasks.empty() : this(tasks: [], totalCount: 0);

  @override
  List<AbstractTask> get tasks => _tasks;
  final List<AbstractTask> _tasks;

  @override
  int get totalCount => _totalCount;
  final int _totalCount;

  @override
  int get pagesCount => (_totalCount / 10).ceil();
}
