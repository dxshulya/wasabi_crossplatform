import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_crossplatform/data/models/base_task.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_total_count.dart';
import 'package:wasabi_crossplatform/domain/repositories/tasks/abstract_tasks_repository.dart';
import 'package:wasabi_crossplatform/presentation/features/tasks/bloc/tasks_event.dart';
import 'package:wasabi_crossplatform/presentation/features/tasks/bloc/tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final AbstractTasksRepository _repository;

  TasksBloc({
    required AbstractTasksRepository repository,
  })  : _repository = repository,
        super(TasksState(page: 1, tasksSavedIds: [], tasksExpandedIds: [])) {
    on<LoadDataEvent>(_onLoadData);
    on<ChangedLikedEvent>(_onChangedLiked);
    on<TotalCountEvent>(_onTotalCountData);
    on<TotalCountStreamEvent>(_onTotalCountDataStream);
    on<ChangeWidgetExpandedEvent>(_onChangeWidgetExpanded);
  }

  FutureOr<void> _onLoadData(
      LoadDataEvent event, Emitter<TasksState> emit) async {
    emit(
      state.copyWith(
        page: state.page,
        data: _repository.fetchTasks(
          page: state.page ?? 1,
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

  Stream<void> _onTotalCountDataStream(
      TotalCountStreamEvent event, Emitter<TasksState> emit) async* {
    emit(
      state.copyWith(
        totalCount: _repository.getTotalCount(),
      ),
    );
  }

  Stream<AbstractTotalCount> get counter {
    return _repository.getTotalCountStream();
  }

  FutureOr<void> _onChangedLiked(
      ChangedLikedEvent event, Emitter<TasksState> emit) async {
    if (!state.tasksSavedIds.contains(event.model.id)) {
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
      state.tasksSavedIds.add(event.model.id);
    } else {
      emit(
        state.copyWith(
          likeData: _repository.deletedTask(event.model.id),
        ),
      );
      state.tasksSavedIds.remove(event.model.id);
    }
  }

  void _onChangeWidgetExpanded(
      ChangeWidgetExpandedEvent event, Emitter<TasksState> emit) {
    if (state.tasksExpandedIds.contains(event.model.id)) {
      state.tasksExpandedIds.add(event.model.id);
    } else {
      state.tasksExpandedIds.remove(event.model.id);
    }
  }
}
