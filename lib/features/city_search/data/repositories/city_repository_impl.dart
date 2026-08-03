import 'package:weather/core/domain/entities/city_entity.dart';
import 'package:weather/features/city_search/data/data_sources/geo_api.dart';
import 'package:weather/features/city_search/data/data_sources/local/local_city_data.dart';
import 'package:weather/features/city_search/data/models/city_model.dart';
import 'package:weather/features/city_search/domain/repositories/city_repository.dart';

class CityRepositoryImpl implements CityRepository {
  final GeoApi _cityDataSource;
  final LocalCityData _localCityData;

  CityRepositoryImpl({required this._cityDataSource, required this._localCityData});

  @override
  Future<Set<CityEntity>> getCity({required String cityQuery}) async
  {
    final Set<CityEntity> output;
    try {
      output = await _cityDataSource.getGeocoding(cityQuery: cityQuery);
    } catch (e) {
      throw UnimplementedError('repo: $e');
    }
    return output;
  }

  @override
  void saveCity({required CityEntity city})
  {
    _localCityData.saveCity(city: city as CityModel);
  }
  
  @override
  Future<CityEntity?> loadLocalCity() {
    return _localCityData.loadCity();
  }
}