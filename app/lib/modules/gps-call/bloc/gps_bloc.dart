// gps_bloc.dart

import 'package:app/modules/gps-call/bloc/gps_event.dart';
import 'package:app/modules/gps-call/bloc/gps_state.dart';
import 'package:app/repositories/gps_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GpsBloc extends Bloc<GpsEvent, GpsState> {
  final GpsRepository gpsRepository;

  GpsBloc({required this.gpsRepository}) : super(GpsInitial()) {
    on<GpsEvent>((event, emit) async {
      if (event == GpsEvent.gpsStarted) {
        emit(GpsLoading());
        try {
          final isGpsEnabled = await gpsRepository.isGpsEnabled();
          final hasPermission = await gpsRepository.hasPermission();

          if (!isGpsEnabled || !hasPermission) {
            emit(GpsFailure(error: 'GPS services disabled or permission denied.'));
            return;
          }

          emit(GpsReady());
        } catch (error) {
          emit(GpsFailure(error: error.toString()));
        }
      } else if (event == GpsEvent.gpsPositionRequested) {
        emit(GpsLoading());
        try {
          final position = await gpsRepository.getCurrentPosition();
          emit(GpsPositionAcquired(latitude: position.latitude, longitude: position.longitude));
        } catch (error) {
          emit(GpsFailure(error: 'Failed to fetch position: ${error.toString()}'));
        }
      }
    });
  }
}
