import 'package:core/core.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final AppRouter _appRouter;

  SettingsBloc({
    required AuthService authService,
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(SettingsState()) {}
}
