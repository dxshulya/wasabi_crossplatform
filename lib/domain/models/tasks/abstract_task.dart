import 'package:wasabi_crossplatform/domain/models/tasks/types/enum_type_from_string.dart';

abstract class AbstractTask with EnumTypeFromString {
  const AbstractTask();

  String get id;

  String get formula;

  String get task;

  String get answer;

  String get datetime;

  @override
  String get type;
}
