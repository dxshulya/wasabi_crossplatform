import 'package:json_annotation/json_annotation.dart';

part 'api_user_dto.g.dart';

@JsonSerializable()
class UserDTO {
  const UserDTO({
    required this.email,
    required this.name,
    required this.password,
  });

  @JsonKey(name: 'email', defaultValue: '')
  final String email;

  @JsonKey(name: 'name', defaultValue: '')
  final String name;

  @JsonKey(name: 'password', defaultValue: '')
  final String password;

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);
}
