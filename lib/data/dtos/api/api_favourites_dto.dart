import 'package:json_annotation/json_annotation.dart';
import 'package:wasabi_crossplatform/data/dtos/api/api_task_dto.dart';

part 'api_favourites_dto.g.dart';

@JsonSerializable()
class FavouritesDTO {
  FavouritesDTO({
    required this.totalCount,
    required this.totalPage,
    required this.favourites,
  });

  @JsonKey(name: 'totalCount', defaultValue: 0)
  final int totalCount;

  @JsonKey(name: 'totalPage', defaultValue: 0)
  final int totalPage;

  @JsonKey(name: 'array', defaultValue: [])
  final List<TaskDTO> favourites;

  factory FavouritesDTO.fromJson(Map<String, dynamic> json) =>
      _$FavouritesDTOFromJson(json);
}
