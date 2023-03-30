import 'package:wasabi_crossplatform/domain/models/auth/abstract_message.dart';
import 'package:wasabi_crossplatform/domain/models/saved/abstract_saves.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';

abstract class AbstractSavedRepository {
  Future<AbstractSaves> fetchSaves(int page);

  Future<AbstractMessage> savedTask(AbstractTask task);

  Future<AbstractMessage> deletedTask(String id);
}
