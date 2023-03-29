import 'package:wasabi_crossplatform/data/dtos/api/api_user_dto.dart';
import 'package:wasabi_crossplatform/data/mappers/api/api_from_dto_to_domain.dart';
import 'package:wasabi_crossplatform/data/services/api/api_service.dart';
import 'package:wasabi_crossplatform/domain/models/auth/abstract_login_response.dart';
import 'package:wasabi_crossplatform/domain/models/auth/abstract_user.dart';
import 'package:wasabi_crossplatform/domain/repositories/auth/abstract_login_repository.dart';

class ApiLoginRepository implements AbstractLoginRepository {
  ApiLoginRepository({
    required ApiService apiService,
  }) : _apiService = apiService;

  final ApiService _apiService;

  @override
  Future<AbstractLogin> login(AbstractUser user) async {
    final response = await _apiService.postLogin(
        user: UserDTO(
            email: user.email, name: user.name ?? '', password: user.password));
    return response.toDomain();
  }
}
