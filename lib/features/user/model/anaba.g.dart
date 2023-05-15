// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anaba.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Anaba _$$_AnabaFromJson(Map<String, dynamic> json) => _$_Anaba(
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      contents: json['contents'] as String?,
      mapId: json['mapId'] as String?,
      imageUrls: (json['imageUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      author: json['author'] as String?,
      price: json['price'] as int?,
    );

Map<String, dynamic> _$$_AnabaToJson(_$_Anaba instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'title': instance.title,
      'description': instance.description,
      'contents': instance.contents,
      'mapId': instance.mapId,
      'imageUrls': instance.imageUrls,
      'author': instance.author,
      'price': instance.price,
    };
