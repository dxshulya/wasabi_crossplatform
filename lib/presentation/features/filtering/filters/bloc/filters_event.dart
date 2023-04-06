import 'package:equatable/equatable.dart';

abstract class FiltersEvent extends Equatable {
  const FiltersEvent();
}

class ChangeFilterPatternEvent extends FiltersEvent {
  final String textPattern;

  const ChangeFilterPatternEvent({required this.textPattern});

  @override
  List<Object> get props => [textPattern];
}

class ChangeTypeFilterEvent extends FiltersEvent {
  final List<String> selectedType;

  const ChangeTypeFilterEvent({required this.selectedType});

  @override
  List<Object> get props => [selectedType];
}
