import 'package:equatable/equatable.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class LoadDataEvent extends TasksEvent {}

class ChangedFavouriteEvent extends TasksEvent {
  final AbstractTask model;

  const ChangedFavouriteEvent({required this.model});
}
