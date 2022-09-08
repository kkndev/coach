import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'pages/settings_page.dart';
import 'pages/details_page.dart';
import 'pages/home_page.dart';
import 'themes/light_theme.dart';
import 'themes/dark_theme.dart';
import 'cubit/user_settings_cubit.dart';
import 'bloc/user_details_bloc.dart';
import 'bloc/user_details_event.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('UserSettings');
  await Hive.openBox('UserDetails');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const HomePage(),
      ),
      GoRoute(
        path: '/details',
        builder: (BuildContext context, GoRouterState state) => BlocProvider(
            create: (_) => UserDetailsBloc()..add(Init()),
            lazy: false,
            child: const DetailsPage()),
      ),
      GoRoute(
        path: '/settings',
        builder: (BuildContext context, GoRouterState state) => BlocProvider(
            create: (_) => UserSettingsCubit()..init(),
            lazy: false,
            child: const SettingsPage()),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}
