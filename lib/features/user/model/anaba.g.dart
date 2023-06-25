// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anaba.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Anaba _$$_AnabaFromJson(Map<String, dynamic> json) => _$_Anaba(
      createdAt: json['createdAt'] == null
          ? const ServerTimestamp()
          : sealedTimestampConverter.fromJson(json['createdAt'] as Object),
      updatedAt: json['updatedAt'] == null
          ? const ServerTimestamp()
          : alwaysUseServerTimestampSealedTimestampConverter
              .fromJson(json['updatedAt'] as Object),
      title: json['title'] as String,
      paidContent: json['paidContent'] as String? ?? '',
      freeContent: json['freeContent'] as String? ?? '',
      authorUID: json['authorUID'] as String,
      mapId: json['mapId'] as String?,
      imageUrls: (json['imageUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      price: json['price'] as int? ?? 100,
    );

Map<String, dynamic> _$$_AnabaToJson(_$_Anaba instance) => <String, dynamic>{
      'createdAt': sealedTimestampConverter.toJson(instance.createdAt),
      'updatedAt': alwaysUseServerTimestampSealedTimestampConverter
          .toJson(instance.updatedAt),
      'title': instance.title,
      'paidContent': instance.paidContent,
      'freeContent': instance.freeContent,
      'authorUID': instance.authorUID,
      'mapId': instance.mapId,
      'imageUrls': instance.imageUrls,
      'price': instance.price,
    };
