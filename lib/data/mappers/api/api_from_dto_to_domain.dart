import 'package:wasabi_crossplatform/data/dtos/api/api_favourites_dto.dart';
import 'package:wasabi_crossplatform/data/dtos/api/api_task_dto.dart';
import 'package:wasabi_crossplatform/data/dtos/api/api_tasks_dto.dart';
import 'package:wasabi_crossplatform/data/models/base_saved.dart';
import 'package:wasabi_crossplatform/data/models/base_task.dart';
import 'package:wasabi_crossplatform/data/models/base_tasks.dart';
import 'package:wasabi_crossplatform/domain/models/saved/abstract_saves.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_tasks.dart';

extension TaskFromDTOToDomain on TaskDTO {
  AbstractTask toDomain() {
    return BaseTask(
      id: id,
      formula: formula,
      task: task,
      answer: answer,
    );
  }
}

extension TasksFromDTOToDomain on TasksDTO {
  AbstractTasks toDomain() {
    return BaseTasks(
      totalCount: totalCount,
      tasks: tasks.map((a) => a.toDomain()).toList(),
    );
  }
}

extension SavedFromDTOToDomain on FavouritesDTO {
  AbstractSaves toDomain() {
    return BaseSaved(
      saves: favourites.map((a) => a.toDomain()).toList(),
      totalCount: totalCount,
      totalPages: totalPage,
    );
  }
}
