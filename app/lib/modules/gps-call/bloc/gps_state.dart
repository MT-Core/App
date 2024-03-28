// gps_state.dart

abstract class GpsState {}

class GpsInitial extends GpsState {}

class GpsLoading extends GpsState {}

class GpsReady extends GpsState {}

class GpsPositionAcquired extends GpsState {
  final double latitude;
  final double longitude;

  GpsPositionAcquired({required this.latitude, required this.longitude});
}

class GpsFailure extends GpsState {
  final String error;

  GpsFailure({required this.error});
}
