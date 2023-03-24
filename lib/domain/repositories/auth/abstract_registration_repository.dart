import 'package:wasabi_crossplatform/domain/models/auth/abstract_registration_response.dart';
import 'package:wasabi_crossplatform/domain/models/auth/abstract_user.dart';

abstract class AbstractRegistrationRepository {
  Future<AbstractRegistration> registration(AbstractUser user);
}
