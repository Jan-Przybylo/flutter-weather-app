import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather/pages/city_search_page.dart';

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
class MainApp extends StatelessWidget {
  MainApp({super.key});

  final String city = "poznan";

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(color: CupertinoColors.white),
        ),
        brightness: Brightness.light,
      ),
      home: CupertinoPageScaffold(child: CitySearchPage()),
    );
  }
}
