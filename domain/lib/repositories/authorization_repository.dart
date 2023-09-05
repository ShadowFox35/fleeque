import 'package:domain/entities/authorization_entity.dart';

abstract class AuthorizationRepository {
  Future<String> firebaseSignIn({
    required AuthorizationModel data,
  });
  Future<String> firebaseSignUp({
    required AuthorizationModel data,
  });
  Future<String> googleSignIn();
  Future<void> signOut();
  Future<void> saveUser(String userId);
  bool checkUser();
}
