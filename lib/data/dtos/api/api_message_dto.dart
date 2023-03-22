import 'package:json_annotation/json_annotation.dart';

part 'api_message_dto.g.dart';

@JsonSerializable()
class MessageDTO {
  const MessageDTO({
    required this.statusCode,
    required this.message,
  });

  @JsonKey(name: 'statusCode', defaultValue: '')
  final String statusCode;

  @JsonKey(name: 'message', defaultValue: '')
  final String message;

  factory MessageDTO.fromJson(Map<String, dynamic> json) =>
      _$MessageDTOFromJson(json);

  Map<String, dynamic> toJson() => _$MessageDTOToJson(this);
}
