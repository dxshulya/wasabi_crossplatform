import 'package:wasabi_crossplatform/data/dtos/api/api_task_dto.dart';
import 'package:wasabi_crossplatform/data/mappers/api/api_from_dto_to_domain.dart';
import 'package:wasabi_crossplatform/data/services/api/api_service.dart';
import 'package:wasabi_crossplatform/domain/models/auth/abstract_message.dart';
import 'package:wasabi_crossplatform/domain/models/saved/abstract_saves.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';
import 'package:wasabi_crossplatform/domain/repositories/saved/abstract_saved_repository.dart';

class ApiSavedRepository implements AbstractSavedRepository {
  ApiSavedRepository({
    required ApiService apiService,
  }) : _apiService = apiService;

  final ApiService _apiService;

  @override
  Future<AbstractSaves> fetchSaves(int page) async {
    final response = await _apiService.loadFavourites(page: page);
    return response.toDomain();
  }

  @override
  Future<AbstractMessage> deletedTask(String id) async {
    final response = await _apiService.deleteFavourite(id: id);
    return response.toDomain();
  }

  @override
  Future<AbstractMessage> savedTask(AbstractTask task) async {
    final response = await _apiService.postFavourite(
        task: TaskDTO(
            id: task.id,
            formula: task.formula,
            task: task.task,
            answer: task.answer,
            datetime: task.datetime,
            type: task.type));
    return response.toDomain();
  }
}
