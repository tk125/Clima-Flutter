import 'dart:convert';

import 'package:flutter/material.dart';
import 'networking.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/location.dart';
import 'package:clima/screens/location_screen.dart';

class WeatherModel {
  Future<dynamic> getLocationDataByCity(String cityName) async {
    var URL =
        'http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';
    NetworkingHelper networkingHelper = NetworkingHelper(URL);
    var returnJson = await networkingHelper.getData();
    return jsonDecode(returnJson);
  }

  Future<dynamic> getLocationData() async {
    Location local = Location();
    await local.getCurrentLocation();
    double lat = local.latitude;
    double long = local.longitude;
    print('haha $lat, $long');
    NetworkingHelper networkingHelper = NetworkingHelper(
        'http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey&units=metric');
    var returnJson = await networkingHelper.getData();
    return jsonDecode(returnJson);
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
