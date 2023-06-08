import 'package:equatable/equatable.dart';
import 'package:wasabi_crossplatform/data/db/database.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';

class FavouritesState extends Equatable {
  final List<TaskTableData> tasks;

  const FavouritesState({
    required this.tasks,
  });

  FavouritesState copyWith({
    List<TaskTableData>? tasks,
  }) =>
      FavouritesState(
        tasks: tasks ?? this.tasks,
      );

  @override
  List<Object> get props => [
        tasks,
      ];
}
