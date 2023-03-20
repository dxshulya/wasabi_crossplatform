import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';

abstract class AbstractTasks {
  int get totalCount;

  int get pagesCount;

  List<AbstractTask> get tasks;
}
