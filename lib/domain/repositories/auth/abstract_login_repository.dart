import 'package:wasabi_crossplatform/domain/models/auth/abstract_login_response.dart';
import 'package:wasabi_crossplatform/domain/models/auth/abstract_user.dart';

abstract class AbstractLoginRepository {
  Future<AbstractLogin> login(AbstractUser user);
}
