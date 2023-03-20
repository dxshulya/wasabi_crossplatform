import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';

abstract class AbstractFavouritesTasksRepository {
  Future<void> deleteFavourite(AbstractTask task);

  Future<void> deleteFavouriteById(String id);

  Future<void> insertFavourite(AbstractTask task);

  bool checkForFavouriteById(String id);

  bool checkForFavourite(AbstractTask task);

  Stream<List<AbstractTask>> onChangedFavourites();

  Future<List<AbstractTask>> onGetAllFavourites();
}
