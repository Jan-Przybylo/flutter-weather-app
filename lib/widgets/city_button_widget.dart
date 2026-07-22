import 'package:flutter/cupertino.dart';
import 'package:weather/models/city_model.dart';
import 'package:weather/pages/weather_page.dart';


class CityButton extends StatelessWidget {
  final City city;

  const CityButton({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      title: Text(
        '${city.name}, ${city.country}, ${city.state}',
        style: TextStyle(color: CupertinoColors.black),
      ),
      trailing: CupertinoListTileChevron(),
      onTap: () => Navigator.of(context).push(
        CupertinoPageRoute<void>(
          builder: (BuildContext context) {
            return WeatherPage(city: city.name);
          },
        ),
      ),
    );
  }
}
