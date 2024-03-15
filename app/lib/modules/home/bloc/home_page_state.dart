part of 'home_page_cubit.dart';

/// [HomePageState] is an abstract class that represents the state of the home page.
abstract class HomePageState {
  /// [HomePageState] constructor.
  const HomePageState();
}

/// [HomePageInitialState] is a class that represents the initial state of the home page.
class HomePageInitialState extends HomePageState {
  /// [HomePageInitialState] constructor.
  const HomePageInitialState();
}

/// [HomePageLoadingState] is a class that represents the loading state of the home page.
class HomePageLoadingState extends HomePageState {
  /// [HomePageLoadingState] constructor.
  const HomePageLoadingState();
}

/// [HomePageLoadedState] is a class that represents the loaded state of the home page.
class HomePageLoadedState extends HomePageState {
  /// [HomePageLoadedState] constructor.
  const HomePageLoadedState();
}

/// [HomePageErrorState] is a class that represents the error state of the home page.
class HomePageErrorState extends HomePageState {
  /// [HomePageErrorState] constructor.
  const HomePageErrorState({required this.message});

  /// [message] is the error message.
  final String message;
}
