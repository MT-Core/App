import 'package:app/repositories/auth_repository.dart';
import 'package:app/repositories/home_repository.dart';
import 'package:app/repositories/profile_repository.dart';
import 'package:get_it/get_it.dart';

/// [Initializer] is a class that initializes the app.
class Initializer {
  /// [init] initializes the app.
  static Future<void> init() async {
    GetIt.I
      ..registerSingleton(const HomeRepository(), signalsReady: true)
      ..registerSingleton(AuthRepository(), signalsReady: true)
      ..registerSingleton(ProfileRepository(), signalsReady: true);
  }
}
