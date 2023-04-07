import 'package:wasabi_crossplatform/domain/models/tasks/types/enum_type.dart';

mixin EnumTypeFromString {
  String get type;

  EnumType stringToEnumType() {
    switch (type) {
      case 'Энергия':
        return EnumType.energy;
      case 'Масса':
        return EnumType.mass;
      default:
        return EnumType.mass;
    }
  }
}