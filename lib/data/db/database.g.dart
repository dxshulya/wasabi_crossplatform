// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TaskTableTable extends TaskTable
    with TableInfo<$TaskTableTable, TaskTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _formulaMeta =
      const VerificationMeta('formula');
  @override
  late final GeneratedColumn<String> formula = GeneratedColumn<String>(
      'formula', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _taskMeta = const VerificationMeta('task');
  @override
  late final GeneratedColumn<String> task = GeneratedColumn<String>(
      'task', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _answerMeta = const VerificationMeta('answer');
  @override
  late final GeneratedColumn<String> answer = GeneratedColumn<String>(
      'answer', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _datetimeMeta =
      const VerificationMeta('datetime');
  @override
  late final GeneratedColumn<String> datetime = GeneratedColumn<String>(
      'datetime', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, formula, task, answer, datetime, type];
  @override
  String get aliasedName => _alias ?? 'task_table';
  @override
  String get actualTableName => 'task_table';
  @override
  VerificationContext validateIntegrity(Insertable<TaskTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('formula')) {
      context.handle(_formulaMeta,
          formula.isAcceptableOrUnknown(data['formula']!, _formulaMeta));
    } else if (isInserting) {
      context.missing(_formulaMeta);
    }
    if (data.containsKey('task')) {
      context.handle(
          _taskMeta, task.isAcceptableOrUnknown(data['task']!, _taskMeta));
    } else if (isInserting) {
      context.missing(_taskMeta);
    }
    if (data.containsKey('answer')) {
      context.handle(_answerMeta,
          answer.isAcceptableOrUnknown(data['answer']!, _answerMeta));
    } else if (isInserting) {
      context.missing(_answerMeta);
    }
    if (data.containsKey('datetime')) {
      context.handle(_datetimeMeta,
          datetime.isAcceptableOrUnknown(data['datetime']!, _datetimeMeta));
    } else if (isInserting) {
      context.missing(_datetimeMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      formula: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}formula'])!,
      task: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}task'])!,
      answer: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}answer'])!,
      datetime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}datetime'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
    );
  }

  @override
  $TaskTableTable createAlias(String alias) {
    return $TaskTableTable(attachedDatabase, alias);
  }
}

class TaskTableData extends DataClass implements Insertable<TaskTableData> {
  final String id;
  final String formula;
  final String task;
  final String answer;
  final String datetime;
  final String type;
  const TaskTableData(
      {required this.id,
      required this.formula,
      required this.task,
      required this.answer,
      required this.datetime,
      required this.type});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['formula'] = Variable<String>(formula);
    map['task'] = Variable<String>(task);
    map['answer'] = Variable<String>(answer);
    map['datetime'] = Variable<String>(datetime);
    map['type'] = Variable<String>(type);
    return map;
  }

  TaskTableCompanion toCompanion(bool nullToAbsent) {
    return TaskTableCompanion(
      id: Value(id),
      formula: Value(formula),
      task: Value(task),
      answer: Value(answer),
      datetime: Value(datetime),
      type: Value(type),
    );
  }

  factory TaskTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskTableData(
      id: serializer.fromJson<String>(json['id']),
      formula: serializer.fromJson<String>(json['formula']),
      task: serializer.fromJson<String>(json['task']),
      answer: serializer.fromJson<String>(json['answer']),
      datetime: serializer.fromJson<String>(json['datetime']),
      type: serializer.fromJson<String>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'formula': serializer.toJson<String>(formula),
      'task': serializer.toJson<String>(task),
      'answer': serializer.toJson<String>(answer),
      'datetime': serializer.toJson<String>(datetime),
      'type': serializer.toJson<String>(type),
    };
  }

  TaskTableData copyWith(
          {String? id,
          String? formula,
          String? task,
          String? answer,
          String? datetime,
          String? type}) =>
      TaskTableData(
        id: id ?? this.id,
        formula: formula ?? this.formula,
        task: task ?? this.task,
        answer: answer ?? this.answer,
        datetime: datetime ?? this.datetime,
        type: type ?? this.type,
      );
  @override
  String toString() {
    return (StringBuffer('TaskTableData(')
          ..write('id: $id, ')
          ..write('formula: $formula, ')
          ..write('task: $task, ')
          ..write('answer: $answer, ')
          ..write('datetime: $datetime, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, formula, task, answer, datetime, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskTableData &&
          other.id == this.id &&
          other.formula == this.formula &&
          other.task == this.task &&
          other.answer == this.answer &&
          other.datetime == this.datetime &&
          other.type == this.type);
}

class TaskTableCompanion extends UpdateCompanion<TaskTableData> {
  final Value<String> id;
  final Value<String> formula;
  final Value<String> task;
  final Value<String> answer;
  final Value<String> datetime;
  final Value<String> type;
  const TaskTableCompanion({
    this.id = const Value.absent(),
    this.formula = const Value.absent(),
    this.task = const Value.absent(),
    this.answer = const Value.absent(),
    this.datetime = const Value.absent(),
    this.type = const Value.absent(),
  });
  TaskTableCompanion.insert({
    required String id,
    required String formula,
    required String task,
    required String answer,
    required String datetime,
    required String type,
  })  : id = Value(id),
        formula = Value(formula),
        task = Value(task),
        answer = Value(answer),
        datetime = Value(datetime),
        type = Value(type);
  static Insertable<TaskTableData> custom({
    Expression<String>? id,
    Expression<String>? formula,
    Expression<String>? task,
    Expression<String>? answer,
    Expression<String>? datetime,
    Expression<String>? type,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (formula != null) 'formula': formula,
      if (task != null) 'task': task,
      if (answer != null) 'answer': answer,
      if (datetime != null) 'datetime': datetime,
      if (type != null) 'type': type,
    });
  }

  TaskTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? formula,
      Value<String>? task,
      Value<String>? answer,
      Value<String>? datetime,
      Value<String>? type}) {
    return TaskTableCompanion(
      id: id ?? this.id,
      formula: formula ?? this.formula,
      task: task ?? this.task,
      answer: answer ?? this.answer,
      datetime: datetime ?? this.datetime,
      type: type ?? this.type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (formula.present) {
      map['formula'] = Variable<String>(formula.value);
    }
    if (task.present) {
      map['task'] = Variable<String>(task.value);
    }
    if (answer.present) {
      map['answer'] = Variable<String>(answer.value);
    }
    if (datetime.present) {
      map['datetime'] = Variable<String>(datetime.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskTableCompanion(')
          ..write('id: $id, ')
          ..write('formula: $formula, ')
          ..write('task: $task, ')
          ..write('answer: $answer, ')
          ..write('datetime: $datetime, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  late final $TaskTableTable taskTable = $TaskTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [taskTable];
}
