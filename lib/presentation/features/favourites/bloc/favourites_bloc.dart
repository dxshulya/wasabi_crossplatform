import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_crossplatform/domain/repositories/abstract_favourites_tasks_repository.dart';
import 'package:wasabi_crossplatform/presentation/features/favourites/bloc/favourites_event.dart';
import 'package:wasabi_crossplatform/presentation/features/favourites/bloc/favourites_state.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  final AbstractFavouritesTasksRepository _repository;

  FavouritesBloc({
    required AbstractFavouritesTasksRepository repository,
  })  : _repository = repository,
        super(const FavouritesState(tasks: [])) {
    on<ChangedFavourite>(_onChangedFavourite);
    on<ChangedFavourites>(_onChangedFavourites);
    on<ClearFavourites>(_onClearFavourites);
    _repository.onChangedFavourites().listen((event) {
      add(ChangedFavourites(models: event));
    });
  }

  void _onChangedFavourite(
      ChangedFavourite event, Emitter<FavouritesState> emit) {
    final domainModel = event.model;

    if (_repository.checkForFavourite(domainModel)) {
      _repository.deleteFavourite(domainModel);
    } else {
      _repository.insertFavourite(domainModel);
    }
  }

  FutureOr<void> _onChangedFavourites(
      ChangedFavourites event, Emitter<FavouritesState> emit) {
    emit(state.copyWith(tasks: event.models));
  }

  FutureOr<void> _onClearFavourites(
      ClearFavourites event, Emitter<FavouritesState> emit) async {
    await _repository.deleteAllFavourites();
  }
}
