import 'package:json_annotation/json_annotation.dart';

part 'api_login_dto.g.dart';

@JsonSerializable()
class LoginDTO {
  const LoginDTO({
    required this.login,
    required this.token,
  });

  @JsonKey(name: 'login', defaultValue: '')
  final String login;

  @JsonKey(name: 'token', defaultValue: '')
  final String token;

  factory LoginDTO.fromJson(Map<String, dynamic> json) =>
      _$LoginDTOFromJson(json);
}