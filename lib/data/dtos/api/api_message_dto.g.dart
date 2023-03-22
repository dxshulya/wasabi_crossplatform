// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageDTO _$MessageDTOFromJson(Map<String, dynamic> json) => MessageDTO(
      statusCode: json['statusCode'] as String? ?? '',
      message: json['message'] as String? ?? '',
    );

Map<String, dynamic> _$MessageDTOToJson(MessageDTO instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
    };
