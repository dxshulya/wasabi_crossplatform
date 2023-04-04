import 'package:json_annotation/json_annotation.dart';

part 'api_task_dto.g.dart';

@JsonSerializable()
class TaskDTO {
  const TaskDTO({
    required this.id,
    required this.formula,
    required this.task,
    required this.answer,
    required this.datetime,
    required this.type,
  });

  @JsonKey(name: 'id', defaultValue: '')
  final String id;

  @JsonKey(name: 'formula', defaultValue: '')
  final String formula;

  @JsonKey(name: 'text', defaultValue: '')
  final String task;

  @JsonKey(name: 'answer', defaultValue: '')
  final String answer;

  @JsonKey(name: 'datetime', defaultValue: '')
  final String datetime;

  @JsonKey(name: 'type', defaultValue: '')
  final String type;

  factory TaskDTO.fromJson(Map<String, dynamic> json) =>
      _$TaskDTOFromJson(json);

  Map<String, dynamic> toJson() => _$TaskDTOToJson(this);
}
