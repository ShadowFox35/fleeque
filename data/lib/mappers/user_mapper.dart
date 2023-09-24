import 'package:data/data.dart';
import 'package:domain/domain.dart';

class UserMapper {
  static UserModel toModel(UserEntity entity) {
    return UserModel(
      name: entity.name,
      email: entity.email,
      number: entity.number,
      instagram: entity.instagram,
      bank: entity.bank,
      imageUrl: entity.imageUrl,
    );
  }

  static UserEntity toEntity(UserModel model) {
    return UserEntity(
      name: model.name ?? '',
      email: model.email ?? '',
      number: model.number ?? '',
      instagram: model.instagram ?? '',
      bank: model.bank ?? '',
      imageUrl: model.imageUrl ?? '',
    );
  }
}

class UserData {
  final String? name;
  final String? email;
  final String? number;
  final String? instagram;
  final String? bank;
  final String? imageUrl;

  UserData({
    this.name,
    this.email,
    this.number,
    this.instagram,
    this.bank,
    this.imageUrl,
  });

//   factory UserData.fromFirestore(
//     DocumentSnapshot<Map<String, dynamic>> snapshot,
//     SnapshotOptions? options,
//   ) {
//     final data = snapshot.data();
//     return UserData(
//       name: data?['name'],
//       email: data?['email'],
//       number: data?['number'],
//       instagram: data?['instagram'],
//       bank: data?['bank'],
//     );
//   }

//   Map<String, dynamic> toFirestore() {
//     return {
//       if (name != null) "name": name,
//       if (email != null) "email": email,
//       if (number != null) "number": number,
//       if (instagram != null) "instagram": instagram,
//       if (bank != null) "bank": bank,
//     };
//   }
}
