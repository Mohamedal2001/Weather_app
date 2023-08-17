




import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';
import 'package:wheather/model/wh_model.dart';
import 'package:wheather/provider/weather_prov.dart';
import 'package:wheather/services/weather_sr.dart';

class MyWidget extends StatelessWidget {
  String? cityname;

  final List<String> city = Weather_model.cities;

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
      ),
      body: Container(
        child: Center(
          child: TypeAheadField(
            textFieldConfiguration: TextFieldConfiguration(
              controller: _controller,
              autofocus: true,
              decoration: InputDecoration(
                labelText: 'Search for a city',
                border: OutlineInputBorder(),
              ),
            ),
            suggestionsCallback: (pattern) {
              return city
                  .where((city) =>
                      city.toLowerCase().startsWith(pattern.toLowerCase()))
                  .toList();
            },
            itemBuilder: (context, suggestion) {
              return ListTile(
                title: Text(suggestion),
              );
            },
            onSuggestionSelected: (suggestion) async {
              _controller.text = suggestion;

              cityname = suggestion;
              weather_sr sr = weather_sr();
              Weather_model weather = await sr.getweather(cityname: cityname!);

              Provider.of<WeatherProvider>(context, listen: false)
                  .weather_Data = weather;

              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}


/*import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';
import 'package:wheather/model/wh_model.dart';
import 'package:wheather/provider/weather_prov.dart';
import 'package:wheather/services/weather_sr.dart';

class MyWidget extends StatelessWidget {
  String? cityname;
  final List<String> cities = [
    'New York',
    'Los Angeles',
    'Chicago',
    'Houston',
    'tripoli',
    'tunis'
    // إضافة المدن الأخرى هنا
  ];
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
      ),
      body: Container(
        child: Center(
          child: TypeAheadField(
            textFieldConfiguration: TextFieldConfiguration(
              controller: _controller,
              autofocus: true,
              decoration: InputDecoration(
                labelText: 'Search for a city',
                border: OutlineInputBorder(),
              ),
            ),
            suggestionsCallback: (pattern) {
              return cities
              
                  .where((city) =>
                      city.toLowerCase().startsWith(pattern.toLowerCase()))
                  .toList();
            },
            itemBuilder: (context, suggestion) {
              return ListTile(
                title: Text(suggestion),
              );
            },
            onSuggestionSelected: (suggestion) {
              _controller.text = suggestion;
              // اتخاذ إجراء عند تحديد اقتراح
              
              (data) async {
                cityname = data;
                weather_sr sr = weather_sr();
                Weather_model weather =
                    await sr.getweather(cityname: cityname!);

                Provider.of<WeatherProvider>(context, listen: false)
                    .weather_Data = weather;

                Navigator.pop(context);
              };
              print('Selected: $suggestion');
            },
          ),
        ),
      ),
    );
  }
}
*/

/**  TypeAheadField(
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
          
          
          TextField(
            onSubmitted: (data) async {
              cityname = data;
              weather_sr sr = weather_sr();
              Weather_model weather = await sr.getweather(cityname: cityname!);

              Provider.of<WeatherProvider>(context,listen: false).weather_Data=weather;
              
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
                suffixIcon: Icon(
                  Icons.search,
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 0, 0), width: 2.0)),
                hintText: "wrire the country",
                hintStyle:
                    TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ),
           */