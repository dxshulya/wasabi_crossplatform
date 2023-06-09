import 'package:wasabi_crossplatform/data/db/database.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';

abstract class AbstractFavouritesTasksRepository {
  Future<void> deleteFavourite(AbstractTask task);

  Future<void> deleteFavouriteById(String id);

  Future<void> deleteAllFavourites();

  Future<void> insertFavourite(AbstractTask task);

  bool checkForFavouriteById(String id);

  bool checkForFavourite(AbstractTask task);

  Stream<List<TaskTableData>> onChangedFavourites();

  Future<List<TaskTableData>> onGetAllFavourites();
}
