import 'package:wasabi_crossplatform/domain/models/filters/abstract_filter.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';

abstract class TaskFilterSource {
  AbstractFilter<Future<List<AbstractTask>>> filter();

  void reset();
}
