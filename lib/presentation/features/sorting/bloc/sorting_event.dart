import 'package:equatable/equatable.dart';

abstract class SortingEvent extends Equatable {
  const SortingEvent();

  @override
  List<Object> get props => [];
}

class ChangeSortDirectionEvent extends SortingEvent {}
