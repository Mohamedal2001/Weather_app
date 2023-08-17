import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wheather/provider/weather_prov.dart';
import 'package:wheather/screens/home.dart';
import 'package:wheather/model/wh_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Weather_model? weather;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: home_page(),
      ),
    );
  }
}
