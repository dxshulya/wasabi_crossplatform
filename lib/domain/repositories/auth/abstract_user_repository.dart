///TODO: переделать под модели
abstract class UserRepository {
  Future<String> login();
  Future<String> registration();
}
