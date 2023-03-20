import 'package:wasabi_crossplatform/data/mappers/api/api_from_dto_to_domain.dart';
import 'package:wasabi_crossplatform/data/services/api/api_service.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_tasks.dart';
import 'package:wasabi_crossplatform/domain/repositories/tasks/abstract_tasks_repository.dart';

import 'dart:developer' as developer;

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
}
