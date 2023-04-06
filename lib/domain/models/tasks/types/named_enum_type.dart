import 'package:wasabi_crossplatform/domain/models/tasks/types/enum_type.dart';

extension NamedEnumType on EnumType {
  String typeToString() {
    switch (this) {
      case EnumType.mass:
        return 'Mass';
      case EnumType.energy:
        return 'Energy';
    }
  }
}

extension EnumTypeString on String {
  EnumType fromTypeString() {
    switch (this) {
      case 'Mass':
        return EnumType.mass;
      case 'Energy':
        return EnumType.energy;
      default:
        return EnumType.mass;
    }
  }
}
