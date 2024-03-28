// gps_page.dart

import 'package:app/modules/gps-call/bloc/gps_bloc.dart';
import 'package:app/modules/gps-call/bloc/gps_event.dart';
import 'package:app/modules/gps-call/bloc/gps_state.dart';
import 'package:app/repositories/gps_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GpsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Provide the GpsBloc to the widget tree
    return BlocProvider(
      create: (context) => GpsBloc(gpsRepository: GpsRepository()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('GPS Location'),
        ),
        body: BlocBuilder<GpsBloc, GpsState>(
          builder: (context, state) {
            // Use a switch statement for cleaner state handling
            switch (state.runtimeType) {
              case GpsInitial:
                return buildInitialInput(context);
              case GpsPositionAcquired:
                return buildPositionDisplay(state);
              case GpsFailure:
                return buildFailureDisplay(state);
              case GpsLoading:
                return Center(child: CircularProgressIndicator());
              default:
                return Center(
                  child: Text("Press 'Share my position' to start."),
                );
            }
          },
        ),
      ),
    );
  }

   Widget buildInitialInput(BuildContext context) {
    // UI for initial state with a button
    return Center(
      child: ElevatedButton(
        onPressed: () {
          BlocProvider.of<GpsBloc>(context).add(GpsEvent.gpsPositionRequested);
        },
        child: Text('Share my position'),
      ),
    );
  }

  Widget buildPositionDisplay(GpsState state) {
    // Cast the state back to GpsPositionAcquired to access its properties
    final positionState = state as GpsPositionAcquired;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Current position:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('Latitude: ${positionState.latitude}'),
          Text('Longitude: ${positionState.longitude}'),
        ],
      ),
    );
  }
  
  Widget buildFailureDisplay(GpsState state) {
    // Cast the state back to GpsFailure to access its properties
    final failureState = state as GpsFailure;

    return Center(
      child: Text(
        'Error: ${failureState.error}',
        style: TextStyle(color: Colors.red, fontSize: 18),
      ),
    );
  }

}
