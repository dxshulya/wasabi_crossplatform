import 'package:wasabi_crossplatform/domain/models/tasks/types/enum_type.dart';

mixin EnumTypeFromString {
  String get type;

  EnumType stringToEnumType() {
    switch (type) {
      case 'energy':
        return EnumType.energy;
      case 'mass':
        return EnumType.mass;
      default:
        return EnumType.unknown;
    }
  }
}