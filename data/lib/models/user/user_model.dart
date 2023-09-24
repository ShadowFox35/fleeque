import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
@HiveType(typeId: 1)
class UserModel with _$UserModel {
  @JsonSerializable(explicitToJson: true)
  factory UserModel({
    @Default('') @HiveField(0) String? name,
    @Default('') @HiveField(1) String? email,
    @Default('') @HiveField(2) String? number,
    @Default('') @HiveField(3) String? instagram,
    @Default('') @HiveField(4) String? bank,
    @Default('') @HiveField(5) String? imageUrl,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
