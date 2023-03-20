import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';

class BaseTask implements AbstractTask {
  const BaseTask({
    required String id,
    required String formula,
    required String task,
    required String answer,
  })  : _id = id,
        _formula = formula,
        _task = task,
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
}
