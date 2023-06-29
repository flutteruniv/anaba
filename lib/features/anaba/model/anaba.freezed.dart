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
  /// 作成日
  @unionTimestampConverter
  UnionTimestamp get createdAt => throw _privateConstructorUsedError;

  /// 更新日
  @alwaysUseServerTimestampUnionTimestampConverter
  UnionTimestamp get updatedAt => throw _privateConstructorUsedError;

  /// タイトル
  String get title => throw _privateConstructorUsedError;

  /// 非購入者を含めた全員が見れるコンテンツ
  String get nonPurchasedContent => throw _privateConstructorUsedError;

  /// 購入者のみ見れるコンテンツ
  String get purchasedContent => throw _privateConstructorUsedError;

  /// googleMapに登録されているID
  String get googleMapId => throw _privateConstructorUsedError;

  /// 表示したい画像のURL
  List<String> get imageUrls => throw _privateConstructorUsedError;

  /// 作者
  String get authorUID => throw _privateConstructorUsedError;

  /// 価格
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
      {@unionTimestampConverter UnionTimestamp createdAt,
      @alwaysUseServerTimestampUnionTimestampConverter UnionTimestamp updatedAt,
      String title,
      String nonPurchasedContent,
      String purchasedContent,
      String googleMapId,
      List<String> imageUrls,
      String authorUID,
      int price});

  $UnionTimestampCopyWith<$Res> get createdAt;
  $UnionTimestampCopyWith<$Res> get updatedAt;
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
    Object? nonPurchasedContent = null,
    Object? purchasedContent = null,
    Object? googleMapId = null,
    Object? imageUrls = null,
    Object? authorUID = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      nonPurchasedContent: null == nonPurchasedContent
          ? _value.nonPurchasedContent
          : nonPurchasedContent // ignore: cast_nullable_to_non_nullable
              as String,
      purchasedContent: null == purchasedContent
          ? _value.purchasedContent
          : purchasedContent // ignore: cast_nullable_to_non_nullable
              as String,
      googleMapId: null == googleMapId
          ? _value.googleMapId
          : googleMapId // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrls: null == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      authorUID: null == authorUID
          ? _value.authorUID
          : authorUID // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UnionTimestampCopyWith<$Res> get createdAt {
    return $UnionTimestampCopyWith<$Res>(_value.createdAt, (value) {
      return _then(_value.copyWith(createdAt: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UnionTimestampCopyWith<$Res> get updatedAt {
    return $UnionTimestampCopyWith<$Res>(_value.updatedAt, (value) {
      return _then(_value.copyWith(updatedAt: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AnabaCopyWith<$Res> implements $AnabaCopyWith<$Res> {
  factory _$$_AnabaCopyWith(_$_Anaba value, $Res Function(_$_Anaba) then) =
      __$$_AnabaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@unionTimestampConverter UnionTimestamp createdAt,
      @alwaysUseServerTimestampUnionTimestampConverter UnionTimestamp updatedAt,
      String title,
      String nonPurchasedContent,
      String purchasedContent,
      String googleMapId,
      List<String> imageUrls,
      String authorUID,
      int price});

  @override
  $UnionTimestampCopyWith<$Res> get createdAt;
  @override
  $UnionTimestampCopyWith<$Res> get updatedAt;
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
    Object? nonPurchasedContent = null,
    Object? purchasedContent = null,
    Object? googleMapId = null,
    Object? imageUrls = null,
    Object? authorUID = null,
    Object? price = null,
  }) {
    return _then(_$_Anaba(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      nonPurchasedContent: null == nonPurchasedContent
          ? _value.nonPurchasedContent
          : nonPurchasedContent // ignore: cast_nullable_to_non_nullable
              as String,
      purchasedContent: null == purchasedContent
          ? _value.purchasedContent
          : purchasedContent // ignore: cast_nullable_to_non_nullable
              as String,
      googleMapId: null == googleMapId
          ? _value.googleMapId
          : googleMapId // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrls: null == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      authorUID: null == authorUID
          ? _value.authorUID
          : authorUID // ignore: cast_nullable_to_non_nullable
              as String,
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
      {@unionTimestampConverter
          this.createdAt = const UnionTimestamp.serverTimestamp(),
      @alwaysUseServerTimestampUnionTimestampConverter
          this.updatedAt = const UnionTimestamp.serverTimestamp(),
      required this.title,
      required this.nonPurchasedContent,
      required this.purchasedContent,
      this.googleMapId = '',
      final List<String> imageUrls = const [],
      required this.authorUID,
      required this.price})
      : _imageUrls = imageUrls;

  factory _$_Anaba.fromJson(Map<String, dynamic> json) =>
      _$$_AnabaFromJson(json);

  /// 作成日
  @override
  @JsonKey()
  @unionTimestampConverter
  final UnionTimestamp createdAt;

  /// 更新日
  @override
  @JsonKey()
  @alwaysUseServerTimestampUnionTimestampConverter
  final UnionTimestamp updatedAt;

  /// タイトル
  @override
  final String title;

  /// 非購入者を含めた全員が見れるコンテンツ
  @override
  final String nonPurchasedContent;

  /// 購入者のみ見れるコンテンツ
  @override
  final String purchasedContent;

  /// googleMapに登録されているID
  @override
  @JsonKey()
  final String googleMapId;

  /// 表示したい画像のURL
  final List<String> _imageUrls;

  /// 表示したい画像のURL
  @override
  @JsonKey()
  List<String> get imageUrls {
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrls);
  }

  /// 作者
  @override
  final String authorUID;

  /// 価格
  @override
  final int price;

  @override
  String toString() {
    return 'Anaba(createdAt: $createdAt, updatedAt: $updatedAt, title: $title, nonPurchasedContent: $nonPurchasedContent, purchasedContent: $purchasedContent, googleMapId: $googleMapId, imageUrls: $imageUrls, authorUID: $authorUID, price: $price)';
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
            (identical(other.nonPurchasedContent, nonPurchasedContent) ||
                other.nonPurchasedContent == nonPurchasedContent) &&
            (identical(other.purchasedContent, purchasedContent) ||
                other.purchasedContent == purchasedContent) &&
            (identical(other.googleMapId, googleMapId) ||
                other.googleMapId == googleMapId) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            (identical(other.authorUID, authorUID) ||
                other.authorUID == authorUID) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      updatedAt,
      title,
      nonPurchasedContent,
      purchasedContent,
      googleMapId,
      const DeepCollectionEquality().hash(_imageUrls),
      authorUID,
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
      {@unionTimestampConverter
          final UnionTimestamp createdAt,
      @alwaysUseServerTimestampUnionTimestampConverter
          final UnionTimestamp updatedAt,
      required final String title,
      required final String nonPurchasedContent,
      required final String purchasedContent,
      final String googleMapId,
      final List<String> imageUrls,
      required final String authorUID,
      required final int price}) = _$_Anaba;

  factory _Anaba.fromJson(Map<String, dynamic> json) = _$_Anaba.fromJson;

  @override

  /// 作成日
  @unionTimestampConverter
  UnionTimestamp get createdAt;
  @override

  /// 更新日
  @alwaysUseServerTimestampUnionTimestampConverter
  UnionTimestamp get updatedAt;
  @override

  /// タイトル
  String get title;
  @override

  /// 非購入者を含めた全員が見れるコンテンツ
  String get nonPurchasedContent;
  @override

  /// 購入者のみ見れるコンテンツ
  String get purchasedContent;
  @override

  /// googleMapに登録されているID
  String get googleMapId;
  @override

  /// 表示したい画像のURL
  List<String> get imageUrls;
  @override

  /// 作者
  String get authorUID;
  @override

  /// 価格
  int get price;
  @override
  @JsonKey(ignore: true)
  _$$_AnabaCopyWith<_$_Anaba> get copyWith =>
      throw _privateConstructorUsedError;
}
