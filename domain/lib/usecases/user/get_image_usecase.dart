import 'package:domain/repositories/user_repository.dart';
import 'package:domain/usecases/usecases.dart';

class GetImageUseCase extends AsyncUseCase<NoParams, String> {
  final UserRepository userRepository;

  GetImageUseCase(this.userRepository);

  @override
  Future<String> execute(NoParams input) async {
    return await userRepository.getUserImagefromStorage();
  }
}
