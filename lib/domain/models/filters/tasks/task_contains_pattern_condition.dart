import 'package:wasabi_crossplatform/domain/models/filters/conditions/abstract_condition.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';

class TaskContainsPatternCondition implements AbstractCondition<AbstractTask> {
  final String pattern;

  TaskContainsPatternCondition(this.pattern);

  @override
  bool check(AbstractTask source) {
    return source.task.toLowerCase().contains(pattern.toLowerCase());
  }
}
