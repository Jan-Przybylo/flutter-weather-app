import 'package:weather/features/city_search/data/data_sources/geo_api.dart';
import 'package:weather/features/city_search/data/models/city_model.dart';

class FakeGeocodingApi implements GeoApi {
  @override
  Future<Set<CityModel>> getGeocoding({required String cityQuery}) async {
    await Future.delayed(Duration(seconds:1));

    final response = '''[
      {
        "name": "Poznań",
        "local_names": {
          "ar": "بوزنان",
          "de": "Posen",
          "lv": "Poznaņa",
          "pl": "Poznań"
        },
        "lat": 52.4006632,
        "lon": 16.91973259178088,
        "country": "PL",
        "state": "Greater Poland Voivodeship"
      },
      {
        "name": "Poznań",
        "local_names": {
          "lv": "Poznaņa",
          "pl": "Poznań",
          "ar": "بوزنان",
          "de": "Posen",
          "eo": "Poznano"
        },
        "lat": 52.4006632,
        "lon": 16.91973259178088,
        "country": "PL",
        "state": "Greater Poland Voivodeship"
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
          "sk": "Poznaň"
        },
        "lat": 52.4082663,
        "lon": 16.9335199,
        "country": "PL",
        "state": "Greater Poland Voivodeship"
      },
      {
        "name": "Poznan",
        "local_names": {
          "uk": "Познань",
          "en": "Poznan",
          "pl": "Poznań",
          "ru": "Познань"
        },
        "lat": 51.59248,
        "lon": 27.46822,
        "country": "UA",
        "state": "Rivne Oblast"
      },
      {
        "name": "Poznań",
        "local_names": {"lt": "Poznanė", "pl": "Poznań"},
        "lat": 51.6768198,
        "lon": 22.3045472,
        "country": "PL",
        "state": "Lublin Voivodeship"
      }
    ]''';
    return CityModel.fromStringToSet(response);
  }
}
