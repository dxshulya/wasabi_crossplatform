import 'package:equatable/equatable.dart';
import 'package:wasabi_crossplatform/data/models/base_saved.dart';
import 'package:wasabi_crossplatform/domain/models/auth/abstract_message.dart';
import 'package:wasabi_crossplatform/domain/models/saved/abstract_saves.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_total_count.dart';

enum SavedStatus {
  initial,
  success,
  error,
}

class SavedState extends Equatable {
  final AbstractSaves data;
  final bool hasReachedMax;
  final SavedStatus status;

  final int page;
  List<String> tasksSavedIds;
  final Future<AbstractMessage>? dislikeData;
  final Stream<AbstractTotalCount>? totalCountStream;

  SavedState({
    this.data = const BaseSaved(saves: [], totalCount: 0, totalPages: 0),
    this.page = 1,
    this.hasReachedMax = false,
    this.status = SavedStatus.initial,
    required this.tasksSavedIds,
    this.dislikeData,
    this.totalCountStream,
  });

  SavedState copyWith({
    AbstractSaves? data,
    int? page,
    bool? hasReachedMax,
    SavedStatus? status,
    List<String>? tasksSavedIds,
    Future<AbstractMessage>? dislikeData,
    Stream<AbstractTotalCount>? totalCountStream,
  }) =>
      SavedState(
          data: data ?? this.data,
          hasReachedMax: hasReachedMax ?? this.hasReachedMax,
          status: status ?? this.status,
          page: page ?? this.page,
          tasksSavedIds: tasksSavedIds ?? this.tasksSavedIds,
          dislikeData: dislikeData ?? this.dislikeData,
          totalCountStream: totalCountStream ?? this.totalCountStream);

  @override
  List<Object> get props => [
        data,
        hasReachedMax,
        status,
        page,
        tasksSavedIds,
        dislikeData ?? 0,
        totalCountStream ?? 0
      ];
}
