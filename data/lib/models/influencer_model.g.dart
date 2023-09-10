// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'influencer_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InfluencerModelAdapter extends TypeAdapter<InfluencerModel> {
  @override
  final int typeId = 0;

  @override
  InfluencerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InfluencerModel();
  }

  @override
  void write(BinaryWriter writer, InfluencerModel obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InfluencerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InfluencerModel _$$_InfluencerModelFromJson(Map<String, dynamic> json) =>
    _$_InfluencerModel(
      image: json['image'] as String? ?? '',
      name: json['name'] as String? ?? '',
      followers: json['followers'] as String? ?? '',
      posts: json['posts'] as int? ?? 0,
    );

Map<String, dynamic> _$$_InfluencerModelToJson(_$_InfluencerModel instance) =>
    <String, dynamic>{
      'image': instance.image,
      'name': instance.name,
      'followers': instance.followers,
      'posts': instance.posts,
    };
