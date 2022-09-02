import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

// ignore: use_key_in_widget_constructors
class LoadingScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void geolocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    // ignore: avoid_print
    print(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //Get the current location
            geolocation();
          },
          child: const Text('Get Location'),
        ),
      ),
    );
  }
}
