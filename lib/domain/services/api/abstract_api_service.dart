import 'package:wasabi_crossplatform/data/dtos/api/api_favourites_dto.dart';
import 'package:wasabi_crossplatform/data/dtos/api/api_login_dto.dart';
import 'package:wasabi_crossplatform/data/dtos/api/api_message_dto.dart';
import 'package:wasabi_crossplatform/data/dtos/api/api_registration_dto.dart';
import 'package:wasabi_crossplatform/data/dtos/api/api_task_dto.dart';
import 'package:wasabi_crossplatform/data/dtos/api/api_tasks_dto.dart';
import 'package:wasabi_crossplatform/data/dtos/api/api_total_count_dto.dart';
import 'package:wasabi_crossplatform/data/dtos/api/api_user_dto.dart';

abstract class AbstractApiService {
  Future<TasksDTO> loadTasks({int page = 1});

  Future<TotalCountDTO> loadTotalCount();

  Future<FavouritesDTO> loadFavourites({int page = 1});

  Future<LoginDTO> postLogin({required UserDTO user});

  Future<RegistrationDTO> postRegistration({required UserDTO user});

  Future<MessageDTO> postFavourite({required TaskDTO task});

  Future<MessageDTO> deleteFavourite({required String id});
}
