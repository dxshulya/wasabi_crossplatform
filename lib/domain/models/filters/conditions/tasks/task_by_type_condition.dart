import 'package:wasabi_crossplatform/domain/models/filters/conditions/abstract_condition.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/types/named_enum_type.dart';

class TaskTypeEqualsCondition implements AbstractCondition<AbstractTask> {
  final String _type;

  TaskTypeEqualsCondition(this._type);

  @override
  bool check(AbstractTask source) {
    return source.stringToEnumType() == _type.fromTypeString();
  }
}
