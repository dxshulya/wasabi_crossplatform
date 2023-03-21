import 'package:wasabi_crossplatform/data/db/database.dart';
import 'package:wasabi_crossplatform/data/models/base_task.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';
import 'package:wasabi_crossplatform/presentation/features/tasks/widgets/models/task_card_model.dart';

extension DomainToTaskTableData on AbstractTask {
  TaskTableData toDatabase() {
    return TaskTableData(
      id: id,
      formula: formula,
      task: task,
      answer: answer,
    );
  }
}

extension TaskTableDataToDomain on TaskTableData {
  AbstractTask toDomain() {
    return BaseTask(
      id: id,
      formula: formula,
      task: task,
      answer: answer,
    );
  }
}

extension AbstractTaskToTaskCardModel on AbstractTask {
  TaskCardModel toTaskCardModel() => TaskCardModel(
        id: id,
        answer: answer,
        formula: formula,
        task: task,
      );
}

extension TaskCardModelToDomain on TaskCardModel {
  AbstractTask toDomain() => BaseTask(
        id: id,
        task: task,
        answer: answer,
        formula: formula,
      );
}
