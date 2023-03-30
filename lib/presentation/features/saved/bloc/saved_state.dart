import 'package:equatable/equatable.dart';
import 'package:wasabi_crossplatform/domain/models/auth/abstract_message.dart';
import 'package:wasabi_crossplatform/domain/models/saved/abstract_saves.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_total_count.dart';

class SavedState extends Equatable {
  final Future<AbstractSaves>? data;
  final int page;
  List<String> tasksSavedIds;
  final Future<AbstractMessage>? dislikeData;
  final Stream<AbstractTotalCount>? totalCountStream;

  SavedState({
    this.data,
    required this.page,
    required this.tasksSavedIds,
    this.dislikeData,
    this.totalCountStream,
  });

  SavedState copyWith({
    Future<AbstractSaves>? data,
    int? page,
    List<String>? tasksSavedIds,
    Future<AbstractMessage>? dislikeData,
    Stream<AbstractTotalCount>? totalCountStream,
  }) =>
      SavedState(
          data: data ?? this.data,
          page: page ?? this.page,
          tasksSavedIds: tasksSavedIds ?? this.tasksSavedIds,
          dislikeData: dislikeData ?? this.dislikeData,
          totalCountStream: totalCountStream ?? this.totalCountStream);

  @override
  List<Object> get props => [data ?? 0, tasksSavedIds, dislikeData ?? 0, totalCountStream ?? 0];
}
