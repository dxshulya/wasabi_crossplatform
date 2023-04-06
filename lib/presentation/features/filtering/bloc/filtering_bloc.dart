import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';
import 'package:wasabi_crossplatform/presentation/features/filtering/bloc/filtering_event.dart';
import 'package:wasabi_crossplatform/presentation/features/filtering/bloc/filtering_state.dart';

class FilteringBloc extends Bloc<FilteringEvent, FilteringState> {
  FilteringBloc({
    required List<AbstractTask> sourceTasks,
  }) : super(FilteringState(
          sourceTasks: sourceTasks,
          filteredTasks: sourceTasks,
        )) {
    on<ApplyFilterEvent>(_onFilterApply);
  }

  void _onFilterApply(
      ApplyFilterEvent event, Emitter<FilteringState> emit) async {
    emit(
      state.copyWith(
        filter: event.filter,
        filteredTasks: await event.filter.apply(
          Future.value(state.sourceTasks),
        ),
      ),
    );
  }
}
