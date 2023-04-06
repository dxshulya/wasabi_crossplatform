import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_crossplatform/presentation/features/filtering/filters/bloc/filters_event.dart';
import 'package:wasabi_crossplatform/presentation/features/filtering/filters/bloc/filters_state.dart';

class FiltersBloc extends Bloc<FiltersEvent, FiltersState> {
  FiltersBloc()
      : super(const FiltersState(selectedTypes: [], textPattern: "")) {
    on<ChangeFilterPatternEvent>(_onChangeFilterPattern);
    on<ChangeTypeFilterEvent>(_onChangeTypeFilter);
  }

  void _onChangeFilterPattern(
      ChangeFilterPatternEvent event, Emitter<FiltersState> emit) {
    emit(state.copyWith(textPattern: event.textPattern));
  }

  void _onChangeTypeFilter(
      ChangeTypeFilterEvent event, Emitter<FiltersState> emit) {
    emit(state.copyWith(selectedTypes: event.selectedType));
  }
}
