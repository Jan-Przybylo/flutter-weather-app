
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:weather/core/exception/api_exception.dart';
import 'package:weather/core/exception/city_search_exception.dart';
import 'package:weather/features/city_search/data/data_sources/geo_api.dart';
import 'package:weather/features/city_search/data/models/city_model.dart';

class GeocodingApi implements GeoApi{

  @override
  Future<Set<CityModel>> getGeocoding({required String cityQuery}) async {
    final String apiKey = dotenv.env['API_KEY'] ?? "";
    if (apiKey == "") throw ApiNotFoundException();

    final url = Uri.https("api.openweathermap.org", "/geo/1.0/direct", {
      'q': cityQuery,
      'limit': "4",
      'appid': apiKey,
    });

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw CitySearchApiException();
    }



    return CityModel.fromStringToSet(response.body);
  }
}
