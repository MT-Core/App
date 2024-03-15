import 'package:app/repositories/home_repository.dart';
import 'package:get_it/get_it.dart';

/// [getIt] is a global instance of [GetIt].
GetIt getIt = GetIt.instance;

/// [Initializer] is a class that initializes the app.
class Initializer {
  /// [init] initializes the app.
  static Future<void> init() async {
    getIt.registerSingleton(HomeRepository(), signalsReady: true);
  }
}
