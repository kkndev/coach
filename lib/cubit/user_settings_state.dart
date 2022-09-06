import 'package:flutter/material.dart' show immutable;

@immutable
class UserSettingsState {
  final bool isDarkTheme;

  const UserSettingsState({
    required this.isDarkTheme,
  });

  const UserSettingsState.empty() : isDarkTheme = false;

  UserSettingsState copyWith({
    bool? isDarkTheme,
  }) {
    return UserSettingsState(
      isDarkTheme: isDarkTheme ?? this.isDarkTheme,
    );
  }
}
