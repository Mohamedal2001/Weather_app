

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wheather/provider/weather_prov.dart';
import 'package:wheather/screens/searchpage.dart';
import 'package:wheather/model/wh_model.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class home_page extends StatefulWidget {
  home_page({Key? key}) : super(key: key);

  State<home_page> createState() => _home_pageSt();
}

class _home_pageSt extends State<home_page> {
   
  Weather_model? weather_Data;
  @override
  Widget build(BuildContext context) {
    weather_Data = Provider.of<WeatherProvider>(context).weather_Data;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return MyWidget();
            }));
          },
        ),
        title: Text("My App"),
      ),
      body: weather_Data == null
          ? Center(
              child: Column(
                children: [
                              Container(
                    
                    child: Center(
                      child: Text(
                        "please press search button 🔎",
                        style: TextStyle(fontSize: 29),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Container(
              child: Column(
                children: [
                  
                  Spacer(
                    flex: 3,
                  ),
                  Text(
                    "${weather_Data!.city}",
                    style: TextStyle(fontSize: 40),
                  ),
                  Text("${weather_Data!.date}", style: TextStyle(fontSize: 32)),
                  Spacer(
                    flex: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(weather_Data!.getimage()),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text("${weather_Data!.temp.toInt()}",
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                  Text(weather_Data!.weather_st,
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                  Spacer(
                    flex: 4,
                  )
                ],
              ),
            ),
    );
  }
}


/*
 import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<String> cities = [
    'New York',
    'Los Angeles',
    'Chicago',
    'Houston',
    'Miami',
    // إضافة المدن الأخرى هنا
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('City Typeahead Example'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TypeAheadField(
            textFieldConfiguration: TextFieldConfiguration(
              autofocus: true,
              decoration: InputDecoration(
                labelText: 'Search for a city',
                border: OutlineInputBorder(),
              ),
            ),
            suggestionsCallback: (pattern) {
              return cities.where((city) => city.toLowerCase().startsWith(pattern.toLowerCase())).toList();
            },
            itemBuilder: (context, suggestion) {
              return ListTile(
                title: Text(suggestion),
              );
            },
            onSuggestionSelected: (suggestion) {
              // اتخاذ إجراء عند تحديد اقتراح
              print('Selected: $suggestion');
            },
          ),
        ),
      ),
    );
  }
} */