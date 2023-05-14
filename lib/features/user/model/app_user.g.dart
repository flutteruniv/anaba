// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppUser _$$_AppUserFromJson(Map<String, dynamic> json) => _$_AppUser(
      detailsSubmitted: json['detailsSubmitted'] as bool? ?? false,
      customerId: json['customerId'] as String?,
      stripeAccountId: json['stripeAccountId'] as String?,
    );

Map<String, dynamic> _$$_AppUserToJson(_$_AppUser instance) =>
    <String, dynamic>{
      'detailsSubmitted': instance.detailsSubmitted,
      'customerId': instance.customerId,
      'stripeAccountId': instance.stripeAccountId,
    };
