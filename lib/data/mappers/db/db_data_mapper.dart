import 'package:wasabi_crossplatform/data/db/database.dart';
import 'package:wasabi_crossplatform/domain/models/base_task.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';
import 'package:wasabi_crossplatform/presentation/features/favourites/widgets/models/favourite_card_model.dart';
import 'package:wasabi_crossplatform/presentation/features/saved/widgets/models/saved_card_model.dart';
import 'package:wasabi_crossplatform/presentation/features/tasks/widgets/models/task_card_model.dart';

extension DomainToTaskTableData on AbstractTask {
  TaskTableData toDatabase() {
    return TaskTableData(
      id: id,
      formula: formula,
      task: task,
      answer: answer,
      type: type,
      datetime: datetime,
    );
  }
}

extension TaskTableDataToDomain on TaskTableData {
  AbstractTask toDomain() {
    return BaseTask(
      id,
      formula,
      task,
      answer,
      datetime,
      type,
    );
  }
}

extension AbstractTaskToTaskCardModel on AbstractTask {
  TaskCardModel toTaskCardModel() => TaskCardModel(
        id: id,
        answer: answer,
        formula: formula,
        task: task,
        datetime: datetime,
        type: type,
      );
}

extension TaskCardModelToDomain on TaskCardModel {
  AbstractTask toDomain() => BaseTask(
        id,
        formula,
        task,
        answer,
        datetime,
        type,
      );
}

extension SavedCardModelToDomain on SavedCardModel {
  AbstractTask toDomain() => BaseTask(
        id,
        formula,
        task,
        answer,
        datetime,
        type,
      );
}

extension FavouriteCardModelToDomain on FavouriteCardModel {
  AbstractTask toDomain() => BaseTask(
        id,
        formula,
        task,
        answer,
        datetime,
        type,
      );
}
