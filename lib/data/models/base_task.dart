import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/types/enum_type.dart';

class BaseTask implements AbstractTask {
  const BaseTask({
    required String id,
    required String formula,
    required String task,
    required String answer,
    required String datetime,
    required String type,
  })  : _id = id,
        _formula = formula,
        _task = task,
        _datetime = datetime,
        _type = type,
        _answer = answer;

  @override
  String get id => _id;
  final String _id;

  @override
  String get formula => _formula;
  final String _formula;

  @override
  String get task => _task;
  final String _task;

  @override
  String get answer => _answer;
  final String _answer;

  @override
  String get datetime => _datetime;
  final String _datetime;

  @override
  String get type => _type;
  final String _type;

  @override
  EnumType stringToEnumType() {
    // TODO: implement stringToEnumType
    throw UnimplementedError();
  }
}
