import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_crossplatform/data/models/base_task.dart';
import 'package:wasabi_crossplatform/domain/repositories/tasks/abstract_tasks_repository.dart';
import 'package:wasabi_crossplatform/presentation/features/tasks/bloc/tasks_event.dart';
import 'package:wasabi_crossplatform/presentation/features/tasks/bloc/tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final AbstractTasksRepository _repository;

  TasksBloc({
    required AbstractTasksRepository repository,
  })  : _repository = repository,
        super(const TasksState(page: 1)) {
    on<LoadDataEvent>(_onLoadData);
    on<ChangedLikedEvent>(_onChangedLiked);
    on<ChangedDislikeEvent>(_onChangedDisliked);
    on<TotalCountEvent>(_onTotalCountData);
  }

  FutureOr<void> _onLoadData(
      LoadDataEvent event, Emitter<TasksState> emit) async {
    emit(
      state.copyWith(
        page: 1,
        data: _repository.fetchTasks(
          page: 1,
        ),
      ),
    );
  }

  FutureOr<void> _onTotalCountData(
      TotalCountEvent event, Emitter<TasksState> emit) async {
    emit(
      state.copyWith(
        totalCount: _repository.getTotalCount(),
      ),
    );
  }

  FutureOr<void> _onChangedLiked(
      ChangedLikedEvent event, Emitter<TasksState> emit) async {
    emit(
      state.copyWith(
        likeData: _repository.savedTask(
          BaseTask(
            id: event.model.id,
            formula: event.model.formula,
            task: event.model.task,
            answer: event.model.answer,
          ),
        ),
      ),
    );
  }

  FutureOr<void> _onChangedDisliked(
      ChangedDislikeEvent event, Emitter<TasksState> emit) async {
    emit(
      state.copyWith(
        likeData: _repository.deletedTask(event.id),
      ),
    );
  }
}
