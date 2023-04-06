import 'package:equatable/equatable.dart';
import 'package:wasabi_crossplatform/domain/models/sorting/sorter.dart';
import 'package:wasabi_crossplatform/domain/models/sorting/task_sorter_by_date.dart';
import 'package:wasabi_crossplatform/domain/models/sorting/task_sorter_by_date_reverse.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';

class SortingState extends Equatable {
  final Sorter<AbstractTask> sorter;
  final bool isReverseSorting;

  SortingState({
    required this.isReverseSorting,
    Sorter<AbstractTask>? sorter,
  }) : sorter = sorter ??
            (isReverseSorting ? TaskSorterByDateReverse() : TaskSorterByDate());

  SortingState copyWith({
    Sorter<AbstractTask>? sorter,
    bool? isReverseSorting,
  }) =>
      SortingState(
        sorter: sorter ?? this.sorter,
        isReverseSorting: isReverseSorting ?? this.isReverseSorting,
      );

  @override
  List<Object> get props => [
        isReverseSorting,
      ];
}
