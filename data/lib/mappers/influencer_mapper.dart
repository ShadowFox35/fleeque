import 'package:data/data.dart';
import 'package:domain/domain.dart';

class InfluencerMapper {
  static InfluencerModel toModel(InfluencerEntity entity) {
    return InfluencerModel(
      image: entity.image,
      name: entity.name,
      followers: entity.followers,
      posts: entity.posts,
    );
  }

  static InfluencerEntity toEntity(InfluencerModel model) {
    return InfluencerEntity(
      image: model.image ?? '',
      name: model.name ?? '',
      followers: model.followers ?? '',
      posts: model.posts ?? 0,
    );
  }
}
