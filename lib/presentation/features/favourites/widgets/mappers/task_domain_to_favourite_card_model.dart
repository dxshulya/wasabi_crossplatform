import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';
import 'package:wasabi_crossplatform/presentation/features/favourites/widgets/models/favourite_card_model.dart';

extension TaskDomainToFavouriteCardModelCardModel on AbstractTask {
  FavouriteCardModel toFavouriteCardModel() {
    return FavouriteCardModel(
      id: id,
      formula: formula,
      task: task,
      answer: answer,
      datetime: datetime,
      type: type,
    );
  }
}
