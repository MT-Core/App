part of 'profile_page_bloc.dart';

/// [ProfilePageEvent] is a class that contains the events for the profile page.
abstract class ProfilePageEvent {
  /// [ProfilePageEvent] constructor.
  const ProfilePageEvent();
}

/// [FetchUserEvent] is a class that contains the fetch user event for the profile page.
class FetchUserEvent extends ProfilePageEvent {
  /// [FetchUserEvent] constructor.
  FetchUserEvent();
}

/// [UpdateUserEvent] is a class that contains the update user event for the profile page.
class UpdateUserEvent extends ProfilePageEvent {
  /// [UpdateUserEvent] constructor.
  UpdateUserEvent({required this.user});

  /// [user] is the user data.
  final UserData user;
}
