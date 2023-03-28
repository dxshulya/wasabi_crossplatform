import 'package:equatable/equatable.dart';
import 'package:wasabi_crossplatform/domain/models/auth/abstract_message.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_tasks.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_total_count.dart';

class TasksState extends Equatable {
  final Future<AbstractTasks>? data;
  final Future<AbstractMessage>? likeData;
  final Future<AbstractTotalCount>? totalCount;
  final int? page;

  const TasksState({this.data, this.page, this.likeData, this.totalCount});

  TasksState copyWith({
    Future<AbstractTasks>? data,
    Future<AbstractMessage>? likeData,
    Future<AbstractTotalCount>? totalCount,
    int? page,
  }) =>
      TasksState(
          data: data ?? this.data,
          page: page ?? this.page,
          likeData: likeData ?? this.likeData,
          totalCount: totalCount ?? this.totalCount);

  @override
  List<Object> get props =>
      [data ?? 0, page ?? 1, likeData ?? 0, totalCount ?? 0];
}
