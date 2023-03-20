import 'package:json_annotation/json_annotation.dart';
import 'package:wasabi_crossplatform/data/dtos/api/api_task_dto.dart';

part 'api_tasks_dto.g.dart';

@JsonSerializable()
class TasksDTO {
  const TasksDTO({
    required this.tasks,
    required this.totalCount,
  });

  @JsonKey(name: 'tasks', defaultValue: [])
  final List<TaskDTO> tasks;

  @JsonKey(name: 'totalCount', defaultValue: 10)
  final int totalCount;

  factory TasksDTO.fromJson(Map<String, dynamic> json) =>
      _$TasksDTOFromJson(json);
}
