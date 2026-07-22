import 'dart:convert';

import 'package:weather/models/city_model.dart';
import 'package:weather/services/geocoding_api.dart';

class CityRepository {
  GeocodingApi geocodingApi = GeocodingApi();
  Future<Set<City>> fetchData({required String city}) async {
    final String unformatedOutput;
    try {
      unformatedOutput = await geocodingApi.getGeocoding(debug: true, city: city);
    } catch (e) {
      throw Exception("Nie udało się pobrać geolokalizacji!: \n $e");
    }
    return stringToCity(unformatedOutput);
  }

  Set<City> stringToCity(String input) {
    final json = jsonDecode(input);
    Set<City> output = {};
    for (var city in json) {
      output.add(
        City(
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
