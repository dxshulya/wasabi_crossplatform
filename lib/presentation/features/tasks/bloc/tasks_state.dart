import 'package:equatable/equatable.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_tasks.dart';

class TasksState extends Equatable {
  final Future<AbstractTasks>? data;
  final int? page;

  const TasksState({this.data, this.page});

  TasksState copyWith({Future<AbstractTasks>? data, int? page}) => TasksState(
        data: data ?? this.data,
        page: page ?? this.page,
      );

  @override
  List<Object> get props => [data ?? 0, page ?? 1];
}
