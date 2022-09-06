import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'user_settings_state.dart';

class UserSettingsCubit extends Cubit<UserSettingsState> {
  UserSettingsCubit() : super(const UserSettingsState.empty());

  void init() {
    var box = Hive.box('UserSettings');

    emit(state.copyWith(
      isDarkTheme: box.get('isDarkTheme'),
    ));
  }

  void toggleTheme() {
    var box = Hive.box('UserSettings');

    box.put('isDarkTheme', !state.isDarkTheme);

    emit(state.copyWith(
      isDarkTheme: !state.isDarkTheme,
    ));
  }
}
