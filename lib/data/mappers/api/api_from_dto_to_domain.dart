import 'package:wasabi_crossplatform/data/dtos/api/api_favourites_dto.dart';
import 'package:wasabi_crossplatform/data/dtos/api/api_login_dto.dart';
import 'package:wasabi_crossplatform/data/dtos/api/api_message_dto.dart';
import 'package:wasabi_crossplatform/data/dtos/api/api_registration_dto.dart';
import 'package:wasabi_crossplatform/data/dtos/api/api_task_dto.dart';
import 'package:wasabi_crossplatform/data/dtos/api/api_tasks_dto.dart';
import 'package:wasabi_crossplatform/data/dtos/api/api_total_count_dto.dart';
import 'package:wasabi_crossplatform/data/models/base_login.dart';
import 'package:wasabi_crossplatform/data/models/base_message.dart';
import 'package:wasabi_crossplatform/data/models/base_registration.dart';
import 'package:wasabi_crossplatform/data/models/base_saved.dart';
import 'package:wasabi_crossplatform/data/models/base_task.dart';
import 'package:wasabi_crossplatform/data/models/base_tasks.dart';
import 'package:wasabi_crossplatform/data/models/base_total_count.dart';
import 'package:wasabi_crossplatform/domain/models/auth/abstract_login_response.dart';
import 'package:wasabi_crossplatform/domain/models/auth/abstract_message.dart';
import 'package:wasabi_crossplatform/domain/models/auth/abstract_registration_response.dart';
import 'package:wasabi_crossplatform/domain/models/saved/abstract_saves.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_tasks.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_total_count.dart';

extension TaskFromDTOToDomain on TaskDTO {
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

extension TotalCountFromDTOToDomain on TotalCountDTO {
  AbstractTotalCount toDomain() {
    return BaseTotalCount(
      totalCount: totalCount,
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

extension LoginFromDTOToDomain on LoginDTO {
  AbstractLogin toDomain() {
    return BaseLogin(
      login: login,
      token: token,
    );
  }
}

extension RegistrationFromDTOToDomain on RegistrationDTO {
  AbstractRegistration toDomain() {
    return BaseRegistration(
      login: login,
      token: token,
    );
  }
}

extension SavedTaskFromDTOToDomain on MessageDTO {
  AbstractMessage toDomain() {
    return BaseMessage(
      message: message,
      statusCode: statusCode,
    );
  }
}
