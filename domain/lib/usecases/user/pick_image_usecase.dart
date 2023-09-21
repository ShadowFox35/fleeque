import 'dart:io';
import 'package:domain/repositories/user_repository.dart';
import 'package:domain/usecases/usecases.dart';

class PickUserImageUseCase extends AsyncUseCase<File, String> {
  final UserRepository userRepository;

  PickUserImageUseCase(this.userRepository);

  @override
  Future<String> execute(File input) async =>
      userRepository.pickUserImage(image: input);
}
