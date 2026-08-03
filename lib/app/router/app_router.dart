import 'package:flutter/material.dart';
import 'package:weather/core/domain/entities/city_entity.dart';
import 'package:weather/core/pages/not_found_page.dart';
import 'package:weather/features/city_search/presentation/pages/city_search_page.dart';
import 'package:weather/features/weather/presentation/pages/weather_page.dart';

class AppRouter {
  final CityEntity? savedCity;

  AppRouter([this.savedCity]);

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/weather':
        if (routeSettings.arguments is CityEntity) {
          return MaterialPageRoute(
            builder: ((context) =>
                WeatherPage(city: routeSettings.arguments as CityEntity)),
          );
        } else {
          return MaterialPageRoute(builder: ((context) => PageNotFound()));
        }

      case '/search':
        return MaterialPageRoute(builder: ((context) => CitySearchPage()));

      default:
        return MaterialPageRoute(builder: ((context) => PageNotFound()));
    }
  }

  List<Route<dynamic>> onGenerateInitialRoutes(String initialRoute) {
    if (savedCity != null) {
      return [
        MaterialPageRoute(builder: ((context) => CitySearchPage())),
        MaterialPageRoute(
          builder: ((context) => WeatherPage(city: savedCity!)),
        ),
      ];
    } else {
      return [MaterialPageRoute(builder: ((context) => CitySearchPage()))];
    }
  }
}
