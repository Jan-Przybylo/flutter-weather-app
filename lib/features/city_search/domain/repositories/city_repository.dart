import 'package:weather/core/domain/entities/city_entity.dart';

abstract class CityRepository {
  Future<Set<CityEntity>> getCity({required String cityQuery});

  void saveCity({required CityEntity city}) {}

  Future<CityEntity?> loadLocalCity();

}