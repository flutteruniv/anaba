import 'package:freezed_annotation/freezed_annotation.dart';

part 'anaba.freezed.dart';
part 'anaba.g.dart';

@freezed
class Anaba with _$Anaba {
  const factory Anaba({
    String? createdAt,
    String? updatedAt,
    String? title,
    String? description,
    String? contents,
    String? mapId,
    List<String>? imageUrls,
    String? author,
    int? price,
  }) = _Anaba;

  factory Anaba.fromJson(Map<String, dynamic> json) => _$AnabaFromJson(json);
}
