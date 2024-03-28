import 'package:app/constants/theme.dart';
import 'package:app/constants/values.dart';
import 'package:app/login_screen.dart';
import 'package:app/modules/gps-call/bloc/gps_bloc.dart';
import 'package:app/modules/home/bloc/home_page_cubit.dart';
import 'package:app/modules/home/home_page.dart';
import 'package:app/repositories/auth_repository.dart';
import 'package:app/repositories/gps_repository.dart';
import 'package:app/repositories/home_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:nested/nested.dart';

/// [App] is a widget that represents the app.
class App extends StatelessWidget {
  /// [App] constructor.
  const App({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: <SingleChildWidget>[
            BlocProvider<HomePageCubit>(create: (_) => HomePageCubit()),
            BlocProvider<GpsBloc>(create: (_) => GpsBloc(gpsRepository: context.read<GpsRepository>()))
          ],
        child: MultiRepositoryProvider(
          providers: <SingleChildWidget>[
            RepositoryProvider<HomeRepository>.value(value: GetIt.I<HomeRepository>()), 
            RepositoryProvider<AuthRepository>.value(value: GetIt.I<AuthRepository>()),
            RepositoryProvider<GpsRepository>.value(value: GetIt.I<GpsRepository>()),
            ],
          child: const AppView(),
        ),
      );
}

/// [AppView] is a widget that represents the app view.
class AppView extends StatefulWidget {
  /// [AppView] constructor.
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) => PopScope(
        canPop: false,
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: appName,
          home: FirebaseAuth.instance.currentUser != null ? const HomePage() : LoginScreen(),
          theme: theme,
          routes: <String, Widget Function(BuildContext)>{HomePage.route: (BuildContext context) => const HomePage()},
        ),
      );
}
