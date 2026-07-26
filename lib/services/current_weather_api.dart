import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:weather/models/city_model.dart';

class CurrentWeatherApi {

  Future<String> getWeather({bool debug = false, required City city }) async {
    final String API_KEY = dotenv.env['API_KEY'] ?? "";
    if (!debug && API_KEY == "") throw Exception("Brakuje klucza API!");
    final String apikey = API_KEY;
    final url = Uri.https("api.openweathermap.org", "/data/2.5/weather", {
      'lat': city.lat.toString(),
      'lon': city.lon.toString(),
      'units': 'metric',
      'appid': apikey,
    });
    if (!debug) {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        // print("FAILED" + response.body);
        throw Exception("Failed to get data: $response");
      }
      return response.body;
    }

    print("DEBUG");
    await Future.delayed(Duration(seconds: 1));
    final response = {
      "coord": {"lon": 10.99, "lat": 44.34},
      "weather": [
        {
          "id": 804,
          "main": "Thunderstorm",
          "description": "overcast clouds",
          "icon": "11d",
        },
      ],
      "base": "stations",
      "main": {
        "temp": 25.43,
        "feels_like": 25.46,
        "temp_min": 24.81,
        "temp_max": 26.16,
        "pressure": 1017,
        "humidity": 55,
        "sea_level": 1017,
        "grnd_level": 952,
      },
      "visibility": 10000,
      "wind": {"speed": 2.95, "deg": 51, "gust": 2.48},
      "clouds": {"all": 95},
      "dt": 1784726892,
      "sys": {
        "type": 2,
        "id": 2004688,
        "country": "IT",
        "sunrise": 1784692333,
        "sunset": 1784746343,
      },
      "timezone": 7200,
      "id": 3163858,
      "name": "Zocca",
      "cod": 200,
    };
    final output = jsonEncode(response);
    return output;
  }
}
