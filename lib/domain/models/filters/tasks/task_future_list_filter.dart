import 'package:wasabi_crossplatform/domain/models/filters/abstract_filter.dart';
import 'package:wasabi_crossplatform/domain/models/filters/conditions/abstract_condition.dart';
import 'package:wasabi_crossplatform/domain/models/filters/conditions/aggregate_condition.dart';
import 'package:wasabi_crossplatform/domain/models/filters/conditions/any_aggregate_condition.dart';
import 'package:wasabi_crossplatform/domain/models/filters/future_list/condition_future_list_filter.dart';
import 'package:wasabi_crossplatform/domain/models/filters/future_list/future_list_filter.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';

class TaskFutureListFilter extends FutureListFilter<AbstractTask> {
  TaskFutureListFilter.empty() : super.empty();

  TaskFutureListFilter.condition(AbstractCondition<AbstractTask> condition)
      : super([ConditionFutureListFilter(condition)]);

  TaskFutureListFilter.everyConditions(
      Iterable<AbstractCondition<AbstractTask>> conditions)
      : this.condition(AggregateCondition(conditions));

  TaskFutureListFilter.anyCondition(
      Iterable<AbstractCondition<AbstractTask>> conditions)
      : this.condition(AnyAggregateCondition(conditions));

  TaskFutureListFilter(
      Iterable<AbstractFilter<Future<List<AbstractTask>>>> filters)
      : super(filters);
}
