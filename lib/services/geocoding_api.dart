import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class GeocodingApi {
  Future<String> getGeocoding({bool debug = false, required String city}) async {
    final String API_KEY = dotenv.env['API_KEY'] ?? "";
    if (!debug && API_KEY == "") throw Exception("Brakuje klucza API!");
    final String apikey = API_KEY;
    final url = Uri.https("api.openweathermap.org", "/geo/1.0/direct", {
      'q': city,
      'limit': "4",
      'appid': apikey,
    });
    if (!debug) {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception("Failed to get data: $response");
      }
      return response.body;
    }

    await Future.delayed(Duration(seconds: 1));

    final response = [
      {
        "name": "Poznań",
        "local_names": {
          "ar": "بوزنان",
          "de": "Posen",
          "lv": "Poznaņa",
          "pl": "Poznań",
        },
        "lat": 52.4006632,
        "lon": 16.91973259178088,
        "country": "PL",
        "state": "Greater Poland Voivodeship",
      },
      {
        "name": "Poznań",
        "local_names": {
          "lv": "Poznaņa",
          "pl": "Poznań",
          "ar": "بوزنان",
          "de": "Posen",
          "eo": "Poznano",
        },
        "lat": 52.4006632,
        "lon": 16.91973259178088,
        "country": "PL",
        "state": "Greater Poland Voivodeship",
      },
      {
        "name": "Poznań",
        "local_names": {
          "fa": "پوزنان",
          "mk": "Познањ",
          "ru": "Познань",
          "lv": "Poznaņa",
          "be": "Познань",
          "ascii": "Poznan",
          "ja": "ポズナン",
          "lt": "Poznanė",
          "feature_name": "Poznan",
          "pl": "Poznań",
          "he": "פוזנן",
          "cs": "Poznaň",
          "eo": "Poznano",
          "de": "Posen",
          "uk": "Познань",
          "zh": "波茲南",
          "ar": "بوزنان",
          "yi": "פּױזן",
          "pt": "Posnânia",
          "la": "Posnania",
          "hu": "Poznań",
          "sk": "Poznaň",
        },
        "lat": 52.4082663,
        "lon": 16.9335199,
        "country": "PL",
        "state": "Greater Poland Voivodeship",
      },
      {
        "name": "Poznan",
        "local_names": {
          "uk": "Познань",
          "en": "Poznan",
          "pl": "Poznań",
          "ru": "Познань",
        },
        "lat": 51.59248,
        "lon": 27.46822,
        "country": "UA",
        "state": "Rivne Oblast",
      },
      {
        "name": "Poznań",
        "local_names": {"lt": "Poznanė", "pl": "Poznań"},
        "lat": 51.6768198,
        "lon": 22.3045472,
        "country": "PL",
        "state": "Lublin Voivodeship",
      },
    ];
    return jsonEncode(response);
  }
}
