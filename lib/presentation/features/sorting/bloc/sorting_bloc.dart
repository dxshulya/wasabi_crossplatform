import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_crossplatform/domain/models/sorting/task_sorter_by_date.dart';
import 'package:wasabi_crossplatform/domain/models/sorting/task_sorter_by_date_reverse.dart';
import 'package:wasabi_crossplatform/presentation/features/sorting/bloc/sorting_event.dart';
import 'package:wasabi_crossplatform/presentation/features/sorting/bloc/sorting_state.dart';

class SortingBloc extends Bloc<SortingEvent, SortingState> {
  SortingBloc({
    required bool sortByReverse,
  }) : super(SortingState(
          isReverseSorting: sortByReverse,
        )) {
    on<ChangeSortDirectionEvent>(_onSortDirectionChanged);
  }

  FutureOr<void> _onSortDirectionChanged(
      ChangeSortDirectionEvent event, Emitter<SortingState> emit) {
    final isReverseSorting = !state.isReverseSorting;
    emit(
      state.copyWith(
        isReverseSorting: isReverseSorting,
        sorter:
            isReverseSorting ? TaskSorterByDateReverse() : TaskSorterByDate(),
      ),
    );
  }
}
