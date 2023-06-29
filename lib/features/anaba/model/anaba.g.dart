// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anaba.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Anaba _$$_AnabaFromJson(Map<String, dynamic> json) => _$_Anaba(
      createdAt: json['createdAt'] == null
          ? const UnionTimestamp.serverTimestamp()
          : unionTimestampConverter.fromJson(json['createdAt'] as Object),
      updatedAt: json['updatedAt'] == null
          ? const UnionTimestamp.serverTimestamp()
          : alwaysUseServerTimestampUnionTimestampConverter
              .fromJson(json['updatedAt'] as Object),
      title: json['title'] as String,
      nonPurchasedContent: json['nonPurchasedContent'] as String,
      purchasedContent: json['purchasedContent'] as String,
      googleMapId: json['googleMapId'] as String? ?? '',
      imageUrls: (json['imageUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      authorUID: json['authorUID'] as String,
      price: json['price'] as int,
    );

Map<String, dynamic> _$$_AnabaToJson(_$_Anaba instance) => <String, dynamic>{
      'createdAt': unionTimestampConverter.toJson(instance.createdAt),
      'updatedAt': alwaysUseServerTimestampUnionTimestampConverter
          .toJson(instance.updatedAt),
      'title': instance.title,
      'nonPurchasedContent': instance.nonPurchasedContent,
      'purchasedContent': instance.purchasedContent,
      'googleMapId': instance.googleMapId,
      'imageUrls': instance.imageUrls,
      'authorUID': instance.authorUID,
      'price': instance.price,
    };
