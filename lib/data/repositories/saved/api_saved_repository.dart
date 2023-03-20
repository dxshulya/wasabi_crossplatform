import 'package:wasabi_crossplatform/data/mappers/api/api_from_dto_to_domain.dart';
import 'package:wasabi_crossplatform/data/services/api/api_service.dart';
import 'package:wasabi_crossplatform/domain/models/saved/abstract_saves.dart';
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
}
