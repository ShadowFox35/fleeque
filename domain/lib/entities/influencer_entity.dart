import 'package:equatable/equatable.dart';

class InfluencerEntity extends Equatable {
  final String image;
  final String name;
  final String country;
  final int price;
  final String time;
  final String followers;
  final int posts;

  const InfluencerEntity({
    required this.image,
    required this.name,
    required this.country,
    required this.price,
    required this.time,
    required this.followers,
    required this.posts,
  });

  @override
  List<Object?> get props =>
      [image, name, country, price, time, followers, posts];
}
