// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_registration_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationDTO _$RegistrationDTOFromJson(Map<String, dynamic> json) =>
    RegistrationDTO(
      login: json['login'] as String? ?? '',
      token: json['token'] as String? ?? '',
    );

Map<String, dynamic> _$RegistrationDTOToJson(RegistrationDTO instance) =>
    <String, dynamic>{
      'login': instance.login,
      'token': instance.token,
    };
