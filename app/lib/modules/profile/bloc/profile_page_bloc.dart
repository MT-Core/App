import 'package:app/models/user_data.dart';
import 'package:app/repositories/profile_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'profile_page_event.dart';
part 'profile_page_state.dart';

/// [ProfilePageBloc] is a class that contains the state management for the profile page.
class ProfilePageBloc extends Bloc<ProfilePageEvent, ProfilePageState> {
  /// [ProfilePageBloc] constructor.
  ProfilePageBloc() : super(ProfilePageInitialState()) {
    on<UpdateUserEvent>((UpdateUserEvent event, Emitter<ProfilePageState> emit) async => GetIt.I<ProfileRepository>().updateUser(event.user));
    on<FetchUserEvent>((FetchUserEvent event, Emitter<ProfilePageState> emit) async {
      emit(ProfilePageLoadingState());
      emit(ProfilePageLoadedState(user: await GetIt.I<ProfileRepository>().getUser()));
    });
  }
}
