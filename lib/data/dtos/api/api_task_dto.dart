import 'package:json_annotation/json_annotation.dart';

part 'api_task_dto.g.dart';

@JsonSerializable()
class TaskDTO {
  const TaskDTO({
    required this.id,
    required this.formula,
    required this.task,
    required this.answer,
  });

  @JsonKey(name: 'id', defaultValue: '')
  final String id;

  @JsonKey(name: 'formula', defaultValue: '')
  final String formula;

  @JsonKey(name: 'text', defaultValue: '')
  final String task;

  @JsonKey(name: 'answer', defaultValue: '')
  final String answer;

  factory TaskDTO.fromJson(
      Map<String, dynamic> json) =>
      _$TaskDTOFromJson(json);
}
