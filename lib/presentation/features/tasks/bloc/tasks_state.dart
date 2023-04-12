import 'package:equatable/equatable.dart';
import 'package:wasabi_crossplatform/domain/models/auth/abstract_message.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_tasks.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_total_count.dart';

class TasksState extends Equatable {
  final Future<AbstractTasks>? data;
  final List<AbstractTask>? fetchedData;
  final Future<AbstractMessage>? likeData;
  final Future<AbstractTotalCount>? totalCount;
  final Stream<AbstractTotalCount>? totalCountStream;
  final int page;
  final int? count;
  List<String> tasksSavedIds;
  List<String> tasksExpandedIds;

  TasksState({
    this.data,
    this.fetchedData,
    this.page = 1,
    this.likeData,
    this.totalCount,
    this.totalCountStream,
    this.count,
    required this.tasksSavedIds,
    required this.tasksExpandedIds,
  });

  TasksState copyWith({
    Future<AbstractTasks>? data,
    List<AbstractTask>? fetchedData,
    Future<AbstractMessage>? likeData,
    Future<AbstractTotalCount>? totalCount,
    Stream<AbstractTotalCount>? totalCountStream,
    int? page,
    int? count,
    List<String>? tasksSavedIds,
    List<String>? tasksExpandedIds,
  }) =>
      TasksState(
        data: data ?? this.data,
        fetchedData: fetchedData ?? this.fetchedData,
        page: page ?? this.page,
        likeData: likeData ?? this.likeData,
        totalCount: totalCount ?? this.totalCount,
        totalCountStream: totalCountStream ?? this.totalCountStream,
        count: count ?? this.count,
        tasksSavedIds: tasksSavedIds ?? this.tasksSavedIds,
        tasksExpandedIds: tasksExpandedIds ?? this.tasksExpandedIds,
      );

  @override
  List<Object> get props => [
        data ?? 0,
        page,
        likeData ?? 0,
        totalCount ?? 0,
        totalCountStream ?? 0,
        count ?? 0,
        tasksSavedIds,
        tasksExpandedIds,
        fetchedData ?? 0,
      ];
}
