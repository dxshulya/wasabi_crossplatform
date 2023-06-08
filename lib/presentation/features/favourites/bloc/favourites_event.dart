import 'package:equatable/equatable.dart';
import 'package:wasabi_crossplatform/data/db/database.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';

abstract class FavouritesEvent extends Equatable {
  const FavouritesEvent();

  @override
  List<Object> get props => [];
}

class ChangedFavourite extends FavouritesEvent {
  final TaskTableData model;

  const ChangedFavourite({required this.model});
}

class ChangedFavourites extends FavouritesEvent {
  final List<TaskTableData> models;

  const ChangedFavourites({required this.models});
}

class ClearFavourites extends FavouritesEvent {}
