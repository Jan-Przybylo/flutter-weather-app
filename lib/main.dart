import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/core/constants.dart';
import 'package:weather/models/city_model.dart';
import 'package:weather/pages/city_search_page.dart';
import 'package:weather/pages/weather_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  runApp(MainApp());
}

//TODO
// - zapamietywanie miasta (automatyczne wlaczanie weatherPage)
// - ui (reszta informacji do wyswietlenia)
// - pogoda z ostatnich dni
// - navigator
class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final City city;
  Widget mainPage = CupertinoActivityIndicator(radius: 20,);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: debug,
      theme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(color: CupertinoColors.white),
        ),
        brightness: Brightness.light,
      ),
      home: mainPage,
    );
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final String? cityJson = prefs.getString('city');
    if (cityJson == null || cityJson.isEmpty) {
      setState(() {
        mainPage = CitySearchPage();
      });
    } else {
      final cityMap = jsonDecode(cityJson) as Map<String, dynamic>;
      city = City.fromJson(cityMap);
      setState(() {
        mainPage = WeatherPage(city: city);
      });
    }
  }
}
