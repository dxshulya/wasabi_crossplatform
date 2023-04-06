import 'package:wasabi_crossplatform/domain/models/tasks/types/enum_type.dart';

mixin EnumTypeFromString {
  String get type;

  EnumType stringToEnumType() {
    switch (type) {
      case 'Energy':
        return EnumType.energy;
      case 'Mass':
        return EnumType.mass;
      default:
        return EnumType.mass;
    }
  }
}