import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../cubit/user_settings_cubit.dart';
import '../cubit/user_settings_state.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SettingsPage')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Go back to home page'),
            ),
            BlocBuilder<UserSettingsCubit, UserSettingsState>(
              builder: (_, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      state.isDarkTheme ? Icons.dark_mode : Icons.light_mode,
                      size: 100,
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          context.read<UserSettingsCubit>().toggleTheme(),
                      child: const Text('change theme'),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
