import 'package:flutterfire_json_converters/flutterfire_json_converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'anaba.freezed.dart';
part 'anaba.g.dart';

@freezed
class Anaba with _$Anaba {
  const factory Anaba({
    @sealedTimestampConverter
    @Default(ServerTimestamp())
    SealedTimestamp createdAt,
    @alwaysUseServerTimestampSealedTimestampConverter
    @Default(ServerTimestamp())
    SealedTimestamp updatedAt,
    required String title,
    @Default('') String paidContent,
    @Default('') String freeContent,
    required String authorUID,
    String? mapId,
    @Default([]) List<String> imageUrls,
    @Default(100) int price,
  }) = _Anaba;

  factory Anaba.fromJson(Map<String, dynamic> json) => _$AnabaFromJson(json);
}
