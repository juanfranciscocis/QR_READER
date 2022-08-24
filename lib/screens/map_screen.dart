import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_reader/providers/db_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget{
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {



  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {

    //retrieve arguments from the previous screen
    final argument = ModalRoute.of(context)!.settings.arguments;
    final scan = argument as ScanModelModel;

    final CameraPosition initialCameraPosition = CameraPosition(
      target: scan.getLatLng(),
      zoom: 17.5,
      tilt: 25,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: initialCameraPosition,
        trafficEnabled: true,
        markers: {
          Marker(
            markerId: MarkerId(scan.id.toString()),
            position: scan.getLatLng(),
          )
        },
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}