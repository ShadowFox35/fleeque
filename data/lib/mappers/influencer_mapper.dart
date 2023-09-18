import 'package:data/data.dart';
import 'package:domain/domain.dart';

class InfluencerMapper {
  static InfluencerModel toModel(InfluencerEntity entity) {
    return InfluencerModel(
      image: entity.image,
      name: entity.name,
      country: entity.country,
      price: entity.price,
      time: entity.time,
      followers: entity.followers,
      posts: entity.posts,
    );
  }

  static InfluencerEntity toEntity(InfluencerModel model) {
    return InfluencerEntity(
      image: model.image ?? '',
      name: model.name ?? '',
      country: model.country ?? '',
      price: model.price ?? 0,
      time: model.time ?? '',
      followers: model.followers ?? '',
      posts: model.posts ?? 0,
    );
  }
}
