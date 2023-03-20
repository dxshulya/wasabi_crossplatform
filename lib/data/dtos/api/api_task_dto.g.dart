// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskDTO _$TaskDTOFromJson(Map<String, dynamic> json) => TaskDTO(
      id: json['id'] as String? ?? '',
      formula: json['formula'] as String? ?? '',
      task: json['text'] as String? ?? '',
      answer: json['answer'] as String? ?? '',
    );

Map<String, dynamic> _$TaskDTOToJson(TaskDTO instance) => <String, dynamic>{
      'id': instance.id,
      'formula': instance.formula,
      'text': instance.task,
      'answer': instance.answer,
    };
