import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_crossplatform/data/models/base_task.dart';
import 'package:wasabi_crossplatform/domain/repositories/saved/abstract_saved_repository.dart';
import 'package:wasabi_crossplatform/presentation/features/saved/bloc/saved_event.dart';
import 'package:wasabi_crossplatform/presentation/features/saved/bloc/saved_state.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {
  final AbstractSavedRepository _repository;

  SavedBloc({
    required AbstractSavedRepository repository,
  })  : _repository = repository,
        super(SavedState(page: 1, tasksSavedIds: [])) {
    on<LoadDataEvent>(_onLoadData);
    on<NextPageLoadEvent>(_onNextPageLoad);
    on<PrevPageLoadEvent>(_onPrevPageLoad);
    on<ChangedLikedEvent>(_onChangedLiked);
  }

  void _onLoadData(LoadDataEvent event, Emitter<SavedState> emit) {
    emit(state.copyWith(data: _repository.fetchSaves(state.page)));
  }

  FutureOr<void> _onNextPageLoad(
      NextPageLoadEvent event, Emitter<SavedState> emit) async {
    final data = await state.data;
    var totalCount = data?.totalPages ?? 1;

    if (state.page < totalCount) {
      emit(state.copyWith(
          page: state.page + 1, data: _repository.fetchSaves(state.page + 1)));
    }
  }

  FutureOr<void> _onPrevPageLoad(
      PrevPageLoadEvent event, Emitter<SavedState> emit) {
    if (state.page > 1) {
      emit(state.copyWith(
          page: state.page - 1, data: _repository.fetchSaves(state.page - 1)));
    }
  }

  FutureOr<void> _onChangedLiked(
      ChangedLikedEvent event, Emitter<SavedState> emit) async {
    if (state.tasksSavedIds.contains(event.model.id)) {
      emit(
        state.copyWith(
          dislikeData: _repository.savedTask(
            BaseTask(
              id: event.model.id,
              formula: event.model.formula,
              task: event.model.task,
              answer: event.model.answer,
              datetime: event.model.datetime,
              type: event.model.type,
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
