import 'package:equatable/equatable.dart';

class InfluencerEntity extends Equatable {
  final String image;
  final String name;
  final String followers;
  final int posts;

  const InfluencerEntity({
    required this.image,
    required this.name,
    required this.followers,
    required this.posts,
  });

  @override
  List<Object?> get props => [image, name, followers, posts];
}
