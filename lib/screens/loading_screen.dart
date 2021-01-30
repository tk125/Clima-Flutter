import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    goToLocation();
    super.initState();
  }

  void goToLocation() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherD = await weatherModel.getLocationData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        weatherData: weatherD,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitCircle(
        color: Colors.white,
      ),
    );
  }
}
