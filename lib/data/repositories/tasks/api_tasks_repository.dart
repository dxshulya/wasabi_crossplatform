import 'package:wasabi_crossplatform/data/dtos/api/api_task_dto.dart';
import 'package:wasabi_crossplatform/data/mappers/api/api_from_dto_to_domain.dart';
import 'package:wasabi_crossplatform/data/services/api/api_service.dart';
import 'package:wasabi_crossplatform/domain/models/auth/abstract_message.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_tasks.dart';
import 'package:wasabi_crossplatform/domain/repositories/tasks/abstract_tasks_repository.dart';

class ApiTasksRepository implements AbstractTasksRepository {
  ApiTasksRepository({
    required ApiService apiService,
  }) : _apiService = apiService;

  final ApiService _apiService;

  @override
  Future<AbstractTasks> fetchTasks({int page = 1}) async {
    final response = await _apiService.loadTasks(page: page);
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
            id: task.id, formula: task.formula, task: task.task, answer: task.answer));
    return response.toDomain();
  }
}
