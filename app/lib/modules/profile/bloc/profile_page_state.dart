part of 'profile_page_bloc.dart';

/// [ProfilePageState] is a class that contains the state management for the profile page.
abstract class ProfilePageState {
  /// [ProfilePageState] constructor.
  const ProfilePageState();
}

/// [ProfilePageInitialState] is a class that contains the initial state of the profile page.
class ProfilePageInitialState extends ProfilePageState {}

/// [ProfilePageLoadingState] is a class that contains the loading state of the profile page.
class ProfilePageLoadingState extends ProfilePageState {}

/// [ProfilePageLoadedState] is a class that contains the loaded state of the profile page.
class ProfilePageLoadedState extends ProfilePageState {
  /// [ProfilePageLoadedState] constructor.
  ProfilePageLoadedState({required this.user});

  /// [user] is the user data.
  final UserData user;
}
