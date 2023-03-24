import 'package:json_annotation/json_annotation.dart';

part 'api_registration_dto.g.dart';

@JsonSerializable()
class RegistrationDTO {
  const RegistrationDTO({
    required this.login,
    required this.token,
  });

  @JsonKey(name: 'login', defaultValue: '')
  final String login;

  @JsonKey(name: 'token', defaultValue: '')
  final String token;

  factory RegistrationDTO.fromJson(Map<String, dynamic> json) =>
      _$RegistrationDTOFromJson(json);
}