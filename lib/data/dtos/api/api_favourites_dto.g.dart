// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_favourites_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavouritesDTO _$FavouritesDTOFromJson(Map<String, dynamic> json) =>
    FavouritesDTO(
      totalCount: json['totalCount'] as int? ?? 0,
      totalPage: json['totalPage'] as int? ?? 0,
      favourites: (json['array'] as List<dynamic>?)
              ?.map((e) => TaskDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$FavouritesDTOToJson(FavouritesDTO instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'totalPage': instance.totalPage,
      'array': instance.favourites,
    };
