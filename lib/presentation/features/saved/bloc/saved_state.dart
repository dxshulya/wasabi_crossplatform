import 'package:equatable/equatable.dart';
import 'package:wasabi_crossplatform/domain/models/saved/abstract_saves.dart';

class SavedState extends Equatable {
  final Future<AbstractSaves>? data;
  final int page;

  const SavedState({
    this.data,
    required this.page,
  });

  SavedState copyWith({
    Future<AbstractSaves>? data,
    int? page,
  }) =>
      SavedState(
        data: data ?? this.data,
        page: page ?? this.page,
      );

  @override
  List<Object> get props => [data ?? 0];
}
