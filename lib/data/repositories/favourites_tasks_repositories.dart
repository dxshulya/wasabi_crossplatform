import 'dart:collection';

import 'package:wasabi_crossplatform/data/db/database.dart';
import 'package:wasabi_crossplatform/data/services/db/db_tasks_service.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';
import 'package:wasabi_crossplatform/domain/repositories/abstract_favourites_tasks_repository.dart';

class FavouritesTasksRepository implements AbstractFavouritesTasksRepository {
  final DBTasksService _service = DBTasksService();
  final HashSet<String> _favouritesTasksIds = HashSet<String>();

  FavouritesTasksRepository() {
    _service.onChangedTasksDB().listen(_update);
  }

  void _update(List<TaskTableData> tasks) {
    _favouritesTasksIds.clear();
    for (var task in tasks) {
      _favouritesTasksIds.add(task.id);
    }
  }

  @override
  Future<void> insertFavourite(AbstractTask task) async {
    await _service.insertTaskDB(task);
  }

  @override
  bool checkForFavourite(AbstractTask task) {
    return checkForFavouriteById(task.id);
  }

  @override
  bool checkForFavouriteById(String id) {
    return _favouritesTasksIds.contains(id);
  }

  @override
  Future<void> deleteFavourite(AbstractTask task) async {
    await deleteFavouriteById(task.id);
  }

  @override
  Future<void> deleteFavouriteById(String id) async {
    await _service.deleteTaskDB(id);
  }

  @override
  Stream<List<TaskTableData>> onChangedFavourites() async* {
    yield* _service.onChangedTasksDB();
  }

  @override
  Future<List<TaskTableData>> onGetAllFavourites() async {
    return _service.getAllTasksDB();
  }

  @override
  Future<void> deleteAllFavourites() async {
    await _service.deleteAll();
  }
}
