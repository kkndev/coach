import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_settings_state.dart';

class UserSettingsCubit extends Cubit<UserSettingsState> {
  UserSettingsCubit() : super(const UserSettingsState.empty());

  void toggleTheme() => emit(state.copyWith(
        isDarkTheme: !state.isDarkTheme,
      ));
}
