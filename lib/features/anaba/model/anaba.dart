import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../configs/union_timestamp.dart';

part 'anaba.freezed.dart';
part 'anaba.g.dart';

@freezed
class Anaba with _$Anaba {
  const factory Anaba({
    /// 作成日
    @unionTimestampConverter
    @Default(UnionTimestamp.serverTimestamp())
    UnionTimestamp createdAt,

    /// 更新日
    @alwaysUseServerTimestampUnionTimestampConverter
    @Default(UnionTimestamp.serverTimestamp())
    UnionTimestamp updatedAt,

    /// タイトル
    required String title,

    /// 非購入者を含めた全員が見れるコンテンツ
    required String nonPurchasedContent,

    /// 購入者のみ見れるコンテンツ
    required String purchasedContent,

    /// googleMapに登録されているID
    @Default('') String googleMapId,

    /// 表示したい画像のURL
    @Default([]) List<String> imageUrls,

    /// 作者
    required String authorUID,

    /// 価格
    required int price,
  }) = _Anaba;

  factory Anaba.fromJson(Map<String, dynamic> json) => _$AnabaFromJson(json);
}
