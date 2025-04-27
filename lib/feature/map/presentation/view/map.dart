import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _MapState();
}

class _MapState extends State<Maps> {
  LatLng mycurrentLocation=const LatLng(28.3949,84.1240);
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: GoogleMap(initialCameraPosition: CameraPosition(target: 
      mycurrentLocation,zoom: 5)),
    );
  }
}