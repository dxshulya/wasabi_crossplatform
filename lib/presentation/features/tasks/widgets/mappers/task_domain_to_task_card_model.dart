import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';
import 'package:wasabi_crossplatform/presentation/features/tasks/widgets/models/task_card_model.dart';

extension TaskDomainToTaskCardModel on AbstractTask {
  TaskCardModel toTaskCardModel() {
    return TaskCardModel(
      id: id,
      formula: formula,
      task: task,
      answer: answer,
    );
  }
}