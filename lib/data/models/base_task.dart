import 'dart:ui';

import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';

class BaseTask extends AbstractTask {
  final String _id;
  final String _formula;
  final String _task;
  final String _answer;
  final String _datetime;
  final String _type;

  const BaseTask(
    this._id,
    this._formula,
    this._task,
    this._answer,
    this._datetime,
    this._type,
  );

  @override
  String get id => _id;

  @override
  String get formula => _formula;

  @override
  String get task => _task;

  @override
  String get answer => _answer;

  @override
  String get datetime => _datetime;

  @override
  String get type => _type;

  @override
  operator ==(other) =>
      other is BaseTask &&
      other.id == id &&
      other.formula == formula &&
      other.task == task &&
      other.answer == answer &&
      other.datetime == datetime &&
      other.type == type;

  @override
  int get hashCode => hashValues(
        id,
        formula,
        task,
        answer,
        datetime,
        type,
      );
}
