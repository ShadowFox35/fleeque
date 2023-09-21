import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'influencer_model.freezed.dart';
part 'influencer_model.g.dart';

@freezed
@HiveType(typeId: 0)
class InfluencerModel with _$InfluencerModel {
  @JsonSerializable(explicitToJson: true)
  factory InfluencerModel({
    @Default('') @HiveField(0) String? image,
    @Default('') @HiveField(1) String? name,
    @Default('') @HiveField(2) String? country,
    @Default(0) @HiveField(3) int? price,
    @Default('') @HiveField(4) String? time,
    @Default('') @HiveField(5) String? followers,
    @Default(0) @HiveField(6) int? posts,
  }) = _InfluencerModel;

  factory InfluencerModel.fromJson(Map<String, dynamic> json) =>
      _$InfluencerModelFromJson(json);
}
