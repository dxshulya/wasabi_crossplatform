import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
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
    on<ChangedFavouriteEvent>(_onChangedFavourite);
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

  FutureOr<void> _onChangedFavourite(
      ChangedFavouriteEvent event, Emitter<TasksState> emit) async {
    emit(
      state.copyWith(

      ),
    );
  }
}
