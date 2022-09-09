import 'package:flutter/material.dart';
import 'package:weather_detection_app/screens/location_screen.dart';
import 'package:weather_detection_app/services/location.dart';
import 'package:weather_detection_app/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apikey = 'ca51da9df29041835675ba9aef176509';

// ignore: use_key_in_widget_constructors
class LoadingScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    geolocationData();
  }

  double latitude = 0, longitude = 0;

  void geolocationData() async {
    Location location = Location();

    await location.getCurrentPosition();

    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikey');

    var weatherData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitPulse(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
