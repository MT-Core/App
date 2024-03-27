import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

/// [LocationPage] is a component that fetches and displays the user's current location.
class LocationPage extends StatefulWidget {
/// [LocationPage] constructor
  const LocationPage({super.key});

  @override
  LocationPageState createState() => LocationPageState();
}

/// The state for [LocationPage] that manages the location data and permission requests.
class LocationPageState extends State<LocationPage> {
  /// The text representation of the current location.
  String _location = 'Unknown';

  /// Requests user's permission to access their location and fetches it.
  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() => _location = 'Location services are disabled.');
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() => _location = 'Location permissions are denied');
        return;
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      setState(() => _location = 'Location permissions are permanently denied, we cannot request permissions.');
      return;
    } 

    // Permissions are granted; proceed to fetch the location data.
    final Position position = await Geolocator.getCurrentPosition();
    setState(() => _location = '${position.latitude}, ${position.longitude}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _determinePosition,
              child: const Text('Get Location'),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(_location),
            ),
          ],
        ),
      ),
    );
  }
}
