// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anaba.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Anaba _$AnabaFromJson(Map<String, dynamic> json) {
  return _Anaba.fromJson(json);
}

/// @nodoc
mixin _$Anaba {
  @sealedTimestampConverter
  SealedTimestamp get createdAt => throw _privateConstructorUsedError;
  @alwaysUseServerTimestampSealedTimestampConverter
  SealedTimestamp get updatedAt => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get paidContent => throw _privateConstructorUsedError;
  String get freeContent => throw _privateConstructorUsedError;
  String get authorUID => throw _privateConstructorUsedError;
  String? get mapId => throw _privateConstructorUsedError;
  List<String> get imageUrls => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnabaCopyWith<Anaba> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnabaCopyWith<$Res> {
  factory $AnabaCopyWith(Anaba value, $Res Function(Anaba) then) =
      _$AnabaCopyWithImpl<$Res, Anaba>;
  @useResult
  $Res call(
      {@sealedTimestampConverter
          SealedTimestamp createdAt,
      @alwaysUseServerTimestampSealedTimestampConverter
          SealedTimestamp updatedAt,
      String title,
      String paidContent,
      String freeContent,
      String authorUID,
      String? mapId,
      List<String> imageUrls,
      int price});
}

/// @nodoc
class _$AnabaCopyWithImpl<$Res, $Val extends Anaba>
    implements $AnabaCopyWith<$Res> {
  _$AnabaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? title = null,
    Object? paidContent = null,
    Object? freeContent = null,
    Object? authorUID = null,
    Object? mapId = freezed,
    Object? imageUrls = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as SealedTimestamp,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as SealedTimestamp,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      paidContent: null == paidContent
          ? _value.paidContent
          : paidContent // ignore: cast_nullable_to_non_nullable
              as String,
      freeContent: null == freeContent
          ? _value.freeContent
          : freeContent // ignore: cast_nullable_to_non_nullable
              as String,
      authorUID: null == authorUID
          ? _value.authorUID
          : authorUID // ignore: cast_nullable_to_non_nullable
              as String,
      mapId: freezed == mapId
          ? _value.mapId
          : mapId // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrls: null == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnabaCopyWith<$Res> implements $AnabaCopyWith<$Res> {
  factory _$$_AnabaCopyWith(_$_Anaba value, $Res Function(_$_Anaba) then) =
      __$$_AnabaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@sealedTimestampConverter
          SealedTimestamp createdAt,
      @alwaysUseServerTimestampSealedTimestampConverter
          SealedTimestamp updatedAt,
      String title,
      String paidContent,
      String freeContent,
      String authorUID,
      String? mapId,
      List<String> imageUrls,
      int price});
}

/// @nodoc
class __$$_AnabaCopyWithImpl<$Res> extends _$AnabaCopyWithImpl<$Res, _$_Anaba>
    implements _$$_AnabaCopyWith<$Res> {
  __$$_AnabaCopyWithImpl(_$_Anaba _value, $Res Function(_$_Anaba) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? title = null,
    Object? paidContent = null,
    Object? freeContent = null,
    Object? authorUID = null,
    Object? mapId = freezed,
    Object? imageUrls = null,
    Object? price = null,
  }) {
    return _then(_$_Anaba(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as SealedTimestamp,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as SealedTimestamp,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      paidContent: null == paidContent
          ? _value.paidContent
          : paidContent // ignore: cast_nullable_to_non_nullable
              as String,
      freeContent: null == freeContent
          ? _value.freeContent
          : freeContent // ignore: cast_nullable_to_non_nullable
              as String,
      authorUID: null == authorUID
          ? _value.authorUID
          : authorUID // ignore: cast_nullable_to_non_nullable
              as String,
      mapId: freezed == mapId
          ? _value.mapId
          : mapId // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrls: null == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Anaba implements _Anaba {
  const _$_Anaba(
      {@sealedTimestampConverter
          this.createdAt = const ServerTimestamp(),
      @alwaysUseServerTimestampSealedTimestampConverter
          this.updatedAt = const ServerTimestamp(),
      required this.title,
      this.paidContent = '',
      this.freeContent = '',
      required this.authorUID,
      this.mapId,
      final List<String> imageUrls = const [],
      this.price = 100})
      : _imageUrls = imageUrls;

  factory _$_Anaba.fromJson(Map<String, dynamic> json) =>
      _$$_AnabaFromJson(json);

  @override
  @JsonKey()
  @sealedTimestampConverter
  final SealedTimestamp createdAt;
  @override
  @JsonKey()
  @alwaysUseServerTimestampSealedTimestampConverter
  final SealedTimestamp updatedAt;
  @override
  final String title;
  @override
  @JsonKey()
  final String paidContent;
  @override
  @JsonKey()
  final String freeContent;
  @override
  final String authorUID;
  @override
  final String? mapId;
  final List<String> _imageUrls;
  @override
  @JsonKey()
  List<String> get imageUrls {
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrls);
  }

  @override
  @JsonKey()
  final int price;

  @override
  String toString() {
    return 'Anaba(createdAt: $createdAt, updatedAt: $updatedAt, title: $title, paidContent: $paidContent, freeContent: $freeContent, authorUID: $authorUID, mapId: $mapId, imageUrls: $imageUrls, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Anaba &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.paidContent, paidContent) ||
                other.paidContent == paidContent) &&
            (identical(other.freeContent, freeContent) ||
                other.freeContent == freeContent) &&
            (identical(other.authorUID, authorUID) ||
                other.authorUID == authorUID) &&
            (identical(other.mapId, mapId) || other.mapId == mapId) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      updatedAt,
      title,
      paidContent,
      freeContent,
      authorUID,
      mapId,
      const DeepCollectionEquality().hash(_imageUrls),
      price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnabaCopyWith<_$_Anaba> get copyWith =>
      __$$_AnabaCopyWithImpl<_$_Anaba>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnabaToJson(
      this,
    );
  }
}

abstract class _Anaba implements Anaba {
  const factory _Anaba(
      {@sealedTimestampConverter
          final SealedTimestamp createdAt,
      @alwaysUseServerTimestampSealedTimestampConverter
          final SealedTimestamp updatedAt,
      required final String title,
      final String paidContent,
      final String freeContent,
      required final String authorUID,
      final String? mapId,
      final List<String> imageUrls,
      final int price}) = _$_Anaba;

  factory _Anaba.fromJson(Map<String, dynamic> json) = _$_Anaba.fromJson;

  @override
  @sealedTimestampConverter
  SealedTimestamp get createdAt;
  @override
  @alwaysUseServerTimestampSealedTimestampConverter
  SealedTimestamp get updatedAt;
  @override
  String get title;
  @override
  String get paidContent;
  @override
  String get freeContent;
  @override
  String get authorUID;
  @override
  String? get mapId;
  @override
  List<String> get imageUrls;
  @override
  int get price;
  @override
  @JsonKey(ignore: true)
  _$$_AnabaCopyWith<_$_Anaba> get copyWith =>
      throw _privateConstructorUsedError;
}
