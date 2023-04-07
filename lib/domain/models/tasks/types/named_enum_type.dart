import 'package:wasabi_crossplatform/domain/models/tasks/types/enum_type.dart';

extension NamedEnumType on EnumType {
  String typeToString() {
    switch (this) {
      case EnumType.mass:
        return 'Масса';
      case EnumType.energy:
        return 'Энергия';
    }
  }
}

extension EnumTypeString on String {
  EnumType fromTypeString() {
    switch (this) {
      case 'Масса':
        return EnumType.mass;
      case 'Энергия':
        return EnumType.energy;
      default:
        return EnumType.mass;
    }
  }
}
