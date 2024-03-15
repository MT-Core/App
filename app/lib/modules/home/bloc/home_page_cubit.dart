import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_page_state.dart';

/// [HomePageCubit] is a cubit that manages the state of the home page.
class HomePageCubit extends Cubit<HomePageState> {
  /// [HomePageCubit] constructor.
  HomePageCubit() : super(const HomePageInitialState()) {
    try {
      emit(const HomePageLoadedState());
    } on Exception {
      emit(const HomePageErrorState(message: 'Error loading home page.'));
    }
  }
}
