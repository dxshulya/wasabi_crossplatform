import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';

abstract class AbstractSaves {
  int get totalCount;

  int get totalPages;

  List<AbstractTask> get saves;
}
