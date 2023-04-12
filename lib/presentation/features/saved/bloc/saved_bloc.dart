import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_crossplatform/data/models/base_saved.dart';
import 'package:wasabi_crossplatform/data/models/base_task.dart';
import 'package:wasabi_crossplatform/domain/repositories/saved/abstract_saved_repository.dart';
import 'package:wasabi_crossplatform/presentation/features/saved/bloc/saved_event.dart';
import 'package:wasabi_crossplatform/presentation/features/saved/bloc/saved_state.dart';
import 'package:wasabi_crossplatform/utils/colorful_debugger.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {
  final AbstractSavedRepository _repository;

  SavedBloc({
    required AbstractSavedRepository repository,
  })  : _repository = repository,
        super(SavedState(tasksSavedIds: [])) {
    on<ChangedLikedEvent>(_onChangedLiked);
    on<SavedFetch>(
      _onSavedFetch,
      transformer: droppable(),
    );

    on<SavedRefresh>(
      _onSavedRefresh,
      transformer: droppable(),
    );
  }

  FutureOr<void> _onSavedFetch(SavedFetch event, Emitter<SavedState> emit) async {
    try {
      if (state.hasReachedMax) return;
      if (state.status == SavedStatus.initial) {
        final data = await _repository.fetchSaves(state.page);
        return emit(
          state.copyWith(
            data: data,
            hasReachedMax: false,
            status: SavedStatus.success,
            page: state.page + 1,
          ),
        );
      }

      final data = await _repository.fetchSaves(state.page);
      if (data.saves.isEmpty) {
        return emit(state.copyWith(hasReachedMax: true));
      } else {
        return emit(
          state.copyWith(
            data: BaseSaved(saves: List.of(state.data.saves)..addAll(data.saves), totalCount: data.totalCount, totalPages: data.totalPages),
            page: state.page + 1,
            hasReachedMax: false,
          ),
        );
      }
    } catch (e) {
      prettyPrint(tag: "SAVED_BLOC", value: e, type: DebugType.error);
      return emit(state.copyWith(status: SavedStatus.error));
    }
  }

  FutureOr<void> _onSavedRefresh(SavedRefresh event, Emitter<SavedState> emit) async {
    emit(SavedState(tasksSavedIds: []));
    await Future.delayed(const Duration(seconds: 1));
    add(const SavedFetch());
  }

  FutureOr<void> _onChangedLiked(
      ChangedLikedEvent event, Emitter<SavedState> emit) async {
    if (state.tasksSavedIds.contains(event.model.id)) {
      emit(
        state.copyWith(
          dislikeData: _repository.savedTask(
            BaseTask(
              event.model.id,
              event.model.formula,
              event.model.task,
              event.model.answer,
              event.model.datetime,
              event.model.type,
            ),
          ),
        ),
      );
      state.tasksSavedIds.remove(event.model.id);
    } else {
      emit(
        state.copyWith(
          dislikeData: _repository.deletedTask(event.model.id),
        ),
      );
      state.tasksSavedIds.add(event.model.id);
    }
  }
}
