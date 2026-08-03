import 'dart:convert';

import 'package:weather/core/domain/entities/city_entity.dart';

class CityModel extends CityEntity {
  const CityModel({
    required super.name,
    required super.lat,
    required super.lon,
    super.country,
    super.state,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'lat': lat,
    'lon': lon,
    if (country != null) 'country': country ?? "",
    if (state != null) 'state': state ?? "",
  };

  CityModel.fromMap(Map<String, dynamic> map)
    : super(
        name: map['name'],
        lat: map['lat'].toString(),
        lon: map['lon'].toString(),
        country: map['country'],
        state: map['state'],
      );

  static Set<CityModel> fromStringToSet(String input) {
    final json = jsonDecode(input);
    Set<CityModel> output = {};
    for (final city in json) {
      output.add(
        CityModel(
          name: city['name'],
          lat: city['lat'].toString(),
          lon: city['lon'].toString(),
          country: city['country'],
          state: city['state'],
        ),
      );
    }
    return output;
  }
}
