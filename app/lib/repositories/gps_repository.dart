// gps_repository.dart

import 'package:geolocator/geolocator.dart';

class GpsRepository {
  /// Check if the location services are enabled.
  Future<bool> isGpsEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  /// Check and request (if necessary) location permissions.
  /// Returns true if permissions are granted.
  Future<bool> hasPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      return permission == LocationPermission.whileInUse || permission == LocationPermission.always;
    }
    return permission == LocationPermission.whileInUse || permission == LocationPermission.always;
  }

  /// Fetches the current GPS position with a high level of accuracy.
  Future<Position> getCurrentPosition() async {
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
}
