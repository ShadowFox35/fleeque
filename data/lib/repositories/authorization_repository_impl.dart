import 'package:data/data.dart';
import 'package:domain/domain.dart';

class AuthorizationRepositoryImpl implements AuthorizationRepository {
  final FirebaseAuthProvider _authProvider;
  final HiveProvider _hiveProvider;

  const AuthorizationRepositoryImpl({
    required FirebaseAuthProvider authProvider,
    required HiveProvider hiveProvider,
  })  : _authProvider = authProvider,
        _hiveProvider = hiveProvider;

  @override
  Future<String> firebaseSignIn({required AuthorizationModel data}) async =>
      await _authProvider.firebaseSignIn(data: data);

  @override
  Future<String> firebaseSignUp({required AuthorizationModel data}) async =>
      await _authProvider.firebaseSignUp(data: data);

  @override
  Future<String> googleSignIn() async => await _authProvider.googleSignIn();

  @override
  Future<void> signOut() async {
    await _authProvider.signOut();
    await _hiveProvider.removeUser();
  }

  @override
  Future<void> saveUser(String userId) async =>
      {await _hiveProvider.saveUserId(userId)};

  @override
  bool checkUser() => _hiveProvider.fetchUserId() != null ? true : false;
}
