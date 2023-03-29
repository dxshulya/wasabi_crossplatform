import 'package:equatable/equatable.dart';
import 'package:wasabi_crossplatform/domain/models/auth/abstract_message.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_tasks.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_total_count.dart';

class TasksState extends Equatable {
  final Future<AbstractTasks>? data;
  final Future<AbstractMessage>? likeData;
  final Future<AbstractTotalCount>? totalCount;
  final Stream<AbstractTotalCount>? totalCountStream;
  final int? page;

  const TasksState(
      {this.data,
      this.page,
      this.likeData,
      this.totalCount,
      this.totalCountStream});

  TasksState copyWith({
    Future<AbstractTasks>? data,
    Future<AbstractMessage>? likeData,
    Future<AbstractTotalCount>? totalCount,
    Stream<AbstractTotalCount>? totalCountStream,
    int? page,
  }) =>
      TasksState(
          data: data ?? this.data,
          page: page ?? this.page,
          likeData: likeData ?? this.likeData,
          totalCount: totalCount ?? this.totalCount,
          totalCountStream: totalCountStream ?? this.totalCountStream);

  @override
  List<Object> get props => [
        data ?? 0,
        page ?? 1,
        likeData ?? 0,
        totalCount ?? 0,
        totalCountStream ?? 0
      ];
}
