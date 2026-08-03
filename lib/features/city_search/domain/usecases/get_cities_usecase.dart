import 'package:weather/core/domain/entities/city_entity.dart';
import 'package:weather/features/city_search/domain/repositories/city_repository.dart';

class GetCitiesUseCase{
  final CityRepository _repository;
  GetCitiesUseCase({required this._repository});
  
  Future<Set<CityEntity>> getCities({required String cityQuery})
  {
    return _repository.getCity(cityQuery: cityQuery);
  }
  

}