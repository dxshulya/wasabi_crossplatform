// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_tasks_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TasksDTO _$TasksDTOFromJson(Map<String, dynamic> json) => TasksDTO(
      tasks: (json['tasks'] as List<dynamic>?)
              ?.map((e) => TaskDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      totalCount: json['totalCount'] as int? ?? 10,
    );

Map<String, dynamic> _$TasksDTOToJson(TasksDTO instance) => <String, dynamic>{
      'tasks': instance.tasks,
      'totalCount': instance.totalCount,
    };
