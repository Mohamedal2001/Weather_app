import 'package:flutter/material.dart';
import 'package:wheather/model/wh_model.dart';

class WeatherProvider extends ChangeNotifier {
  Weather_model? _weather_Data;

  set weather_Data(Weather_model? weather) {
    _weather_Data = weather;
    notifyListeners();
  }

  Weather_model? get weather_Data => _weather_Data;
}
