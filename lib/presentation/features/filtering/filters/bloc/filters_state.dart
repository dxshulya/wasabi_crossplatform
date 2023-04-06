import 'package:equatable/equatable.dart';

class FiltersState extends Equatable {
  final List<String> selectedTypes;
  final String textPattern;

  const FiltersState({
    required this.selectedTypes,
    required this.textPattern,
  });

  FiltersState copyWith({
    List<String>? selectedTypes,
    String? textPattern,
  }) =>
      FiltersState(
        selectedTypes: selectedTypes ?? this.selectedTypes,
        textPattern: textPattern ?? this.textPattern,
      );

  @override
  List<Object> get props => [
        selectedTypes,
        textPattern,
      ];
}
