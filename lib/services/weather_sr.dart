import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:wheather/model/wh_model.dart';

class weather_sr {
  String baseurl = "http://api.weatherapi.com/v1";
  String apikey = "091e400ae1a74679a3f111850231707";
  Future<Weather_model> getweather({required String cityname}) async {
    Uri url = Uri.parse(
        "$baseurl/forecast.json?key=$apikey&q=$cityname&days=1&aqi=no&alerts=no");
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
  

    Weather_model weather = Weather_model.fromjson(data);

    return weather;
  }
}
