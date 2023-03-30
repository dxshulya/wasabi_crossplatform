import 'package:equatable/equatable.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class LoadDataEvent extends TasksEvent {}

class TotalCountEvent extends TasksEvent {}

class TotalCountStreamEvent extends TasksEvent {}

class ChangedLikedEvent extends TasksEvent {
  final AbstractTask model;

  const ChangedLikedEvent({required this.model});
}
