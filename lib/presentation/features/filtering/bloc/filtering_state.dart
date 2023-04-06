import 'package:equatable/equatable.dart';
import 'package:wasabi_crossplatform/domain/models/filters/abstract_filter.dart';
import 'package:wasabi_crossplatform/domain/models/filters/tasks/task_future_list_filter.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';

class FilteringState extends Equatable {
  final List<AbstractTask> filteredTasks;
  final List<AbstractTask> sourceTasks;

  final AbstractFilter<Future<List<AbstractTask>>> filter;

  FilteringState({
    List<AbstractTask>? filteredTasks,
    List<AbstractTask>? sourceTasks,
    AbstractFilter<Future<List<AbstractTask>>>? filter,
  })  : filter = filter ?? TaskFutureListFilter.empty(),
        filteredTasks = filteredTasks ?? [],
        sourceTasks = sourceTasks ?? [];

  FilteringState copyWith({
    List<AbstractTask>? filteredTasks,
    List<AbstractTask>? sourceTasks,
    AbstractFilter<Future<List<AbstractTask>>>? filter,
  }) =>
      FilteringState(
        filteredTasks: filteredTasks ?? this.filteredTasks,
        filter: filter ?? this.filter,
        sourceTasks: sourceTasks ?? this.sourceTasks,
      );

  @override
  List<Object> get props => [
        sourceTasks,
        filteredTasks,
        filter,
      ];
}
