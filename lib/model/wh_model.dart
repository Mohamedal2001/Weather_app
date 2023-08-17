class Weather_model {
  String city;
  String date;
  double temp;
  String weather_st;

  Weather_model(
      {required this.date,
      required this.temp,
      required this.weather_st,
      required this.city});

  factory Weather_model.fromjson(dynamic data) {
    var jsonD = data["forecast"]["forecastday"][0]["day"];

    return Weather_model(
        city: data["location"]["name"],
        date: data["location"]["localtime"],
        temp: jsonD["avgtemp_c"],
        weather_st: jsonD["condition"]["text"]);
  }

  String getimage() {
    if (weather_st == "Sunny") {
      return "assets/weather/01d.png";
    } else if (weather_st == "Patchy rain possible" || weather_st == "ٌRain") {
      return "assets/weather/09d.png";
    } else if (weather_st == "Cloudy" ||weather_st == "Partly cloudy") {
      return "assets/weather/03d.png";
    } else {
      return "assets/weather/01d.png";
    }
  }

  static  List<String> cities = [
    // مدن عربية
    'Cairo',
    'Alexandria',
    'Giza',
    'Riyadh',
    'Jeddah',
    'Mecca',
    'Medina',
    'Baghdad',
    'Casablanca',
    'Tunis',
    'Sanaa',
    'Khartoum',
    'Muscat',
    'Damascus',
    'Kuwait City',
    'Doha',
    'Manama',
    'Amman',
    'Tripoli',
    'Algiers',
    'Beirut',
    // مدن لاتينية
    'Buenos Aires',
    'Sao Paulo',
    'Rio de Janeiro',
    'Mexico City',
    'Lima',
    'Bogota',
    'Santiago',
    'Caracas',
    'Lisbon',
    'Madrid',
    'Barcelona',
    'Paris',
    'Rome',
    'Berlin',
    'Amsterdam',
    'London',
    'Moscow',
    'Beijing',
    'Tokyo',
    'Seoul',
    'Sydney',
    'New York',
    'Los Angeles',
    // مدن أخرى
    'Toronto',
    'Chicago',
    'Houston',
    'Dallas',
    'Miami',
    'Dubai',
    'Abu Dhabi',
    'Kuala Lumpur',
    'Singapore',
    'Bangkok',
    'Jakarta',
    'Mumbai',
    'Delhi',
    'Istanbul',
    'Cape Town',
    'Nairobi',
    'Copenhagen',
    'Stockholm',
    'Oslo',
    'Helsinki',
    'Vienna',
    'Zurich',
    'Riyadh',
    'Doha',
    'Jeddah',
    'Kuwait City',
    'Manama',
    'Amman',
    'Dammam',
    'Cairo',
    'Alexandria',
    'Cairo',
    'Istanbul',
    'Tel Aviv',
    'Amman',
    'Beirut',
    'Baghdad',
    'Riyadh',
    'Kuwait City',
    'Doha',
    'Manama',
    'Abu Dhabi',
    'Dubai',
    'Muscat',
    'Tehran',

  'Beirut',
  'Tripoli',
  'Benghazi',
  'Misrata',
  'Zawiya',
  'Sabha',
  'Ajdabiya',
  'Zliten',
  'Al Khums',
  'Al Bayda',
  'Derna',
  'Sirte',
  'Tobruk',
  'Murzuq',
  'Sebha',
  'Gharyan',
  'Tarhuna',
  'Kufra',
    // إضافة المزيد من المدن هنا
  ];
}
