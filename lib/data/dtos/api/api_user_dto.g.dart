// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) => UserDTO(
      email: json['email'] as String? ?? '',
      name: json['name'] as String? ?? '',
      password: json['password'] as String? ?? '',
    );

Map<String, dynamic> _$UserDTOToJson(UserDTO instance) => <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'password': instance.password,
    };
