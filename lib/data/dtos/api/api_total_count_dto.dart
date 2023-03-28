import 'package:json_annotation/json_annotation.dart';

part 'api_total_count_dto.g.dart';

@JsonSerializable()
class TotalCountDTO {
  const TotalCountDTO({
    required this.totalCount,
  });

  @JsonKey(name: 'totalCount', defaultValue: 0)
  final int totalCount;

  factory TotalCountDTO.fromJson(Map<String, dynamic> json) =>
      _$TotalCountDTOFromJson(json);

  Map<String, dynamic> toJson() => _$TotalCountDTOToJson(this);
}
