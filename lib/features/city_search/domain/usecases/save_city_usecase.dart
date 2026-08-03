import 'package:weather/core/domain/entities/city_entity.dart';
import 'package:weather/features/city_search/domain/repositories/city_repository.dart';

class SaveCityUseCase{
  final CityRepository _repository;
  SaveCityUseCase({required this._repository});
  
  void save({required CityEntity city})
  {
    _repository.saveCity(city: city);
  }

}