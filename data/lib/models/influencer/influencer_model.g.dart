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
    return InfluencerModel(
      image: fields[0] as String?,
      name: fields[1] as String?,
      country: fields[2] as String?,
      price: fields[3] as int?,
      time: fields[4] as String?,
      followers: fields[5] as String?,
      posts: fields[6] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, InfluencerModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.country)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.time)
      ..writeByte(5)
      ..write(obj.followers)
      ..writeByte(6)
      ..write(obj.posts);
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
      country: json['country'] as String? ?? '',
      price: json['price'] as int? ?? 0,
      time: json['time'] as String? ?? '',
      followers: json['followers'] as String? ?? '',
      posts: json['posts'] as int? ?? 0,
    );

Map<String, dynamic> _$$_InfluencerModelToJson(_$_InfluencerModel instance) =>
    <String, dynamic>{
      'image': instance.image,
      'name': instance.name,
      'country': instance.country,
      'price': instance.price,
      'time': instance.time,
      'followers': instance.followers,
      'posts': instance.posts,
    };
