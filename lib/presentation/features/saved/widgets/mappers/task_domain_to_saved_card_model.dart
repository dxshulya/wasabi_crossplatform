import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';
import 'package:wasabi_crossplatform/presentation/features/saved/widgets/models/saved_card_model.dart';

extension TaskDomainToSavedCardModel on AbstractTask {
  SavedCardModel toSavedCardModel() {
    return SavedCardModel(
      id: id,
      formula: formula,
      task: task,
      answer: answer,
    );
  }
}
