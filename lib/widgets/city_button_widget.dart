import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/models/city_model.dart';
import 'package:weather/pages/weather_page.dart';


class CityButton extends StatelessWidget {
  final City city;

  const CityButton({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    final StatelessWidget leading;
    if(city.saved) leading = Icon(CupertinoIcons.home, color: CupertinoColors.black,);
    else leading = Container();
    return CupertinoListTile.notched(
      leading: leading,
      title: Text(
        city.fullName,
        style: TextStyle(color: CupertinoColors.black),
      ),
      trailing: CupertinoListTileChevron(),
      onTap: () {
        changeCity(context);
      },
    );
  }

  void setCity() async
  {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('city', jsonEncode(city.toJson()) );
  }

  void changeCity(BuildContext context)
  {
    setCity();
    Navigator.of(context).push(
        CupertinoPageRoute<void>(
          builder: (BuildContext context) {
            

            return WeatherPage(city: city);
          },
        ),
      );
  }
}
