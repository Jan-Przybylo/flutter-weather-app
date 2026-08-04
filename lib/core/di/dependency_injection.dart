import 'package:get_it/get_it.dart';
import 'package:weather/app/local_data.dart';
import 'package:weather/core/constants/constants.dart';
import 'package:weather/features/city_search/data/data_sources/fake/fake_geocoding_api.dart';
import 'package:weather/features/city_search/data/data_sources/local/local_city_data.dart';
import 'package:weather/features/city_search/data/data_sources/remote/geocoding_api.dart';
import 'package:weather/features/city_search/data/repositories/city_repository_impl.dart';
import 'package:weather/features/city_search/domain/repositories/city_repository.dart';
import 'package:weather/features/city_search/domain/usecases/get_cities_usecase.dart';
import 'package:weather/features/city_search/domain/usecases/get_saved_city_usecase.dart';
import 'package:weather/features/city_search/domain/usecases/save_city_usecase.dart';
import 'package:weather/features/city_search/presentation/cubits/city_cubit.dart';
import 'package:weather/features/weather/data/data_sources/fake/fake_current_weather_api.dart';
import 'package:weather/features/weather/data/data_sources/fake/fake_forecast_weather_api.dart';
import 'package:weather/features/weather/data/data_sources/remote/current_weather_api.dart';
import 'package:weather/features/weather/data/data_sources/remote/forecast_weather_api.dart';
import 'package:weather/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:weather/features/weather/domain/usecases/get_weather.dart';
import 'package:weather/features/weather/presentation/cubit/weather_cubit.dart';

GetIt getIt = GetIt.instance;

void loadLocator() {
  // ************
  // Weather feature
  // ************
  if (!debug) {
    getIt.registerFactory<WeatherCubit>(
      () => WeatherCubit(
        getWeatherUseCase: GetWeatherUseCase(
          WeatherRepositoryImpl(
            currentWeatherApi: CurrentWeatherApi(),
            forecastWeatherApi: ForecastWeatherApi(),
          ),
        ),
      ),
    );
  } else {
    getIt.registerFactory<WeatherCubit>(
      () => WeatherCubit(
        getWeatherUseCase: GetWeatherUseCase(
          WeatherRepositoryImpl(
            currentWeatherApi: FakeCurrentWeatherApi(),
            forecastWeatherApi: FakeForecastWeatherApi(),
          ),
        ),
      ),
    );
  }

  // ************
  // City feature
  // ************
  final CityRepository cityRepository;
  final GetSavedCityUsecase getSavedCityUsecase;

  if (!debug) {
    cityRepository = CityRepositoryImpl(
      cityDataSource: GeocodingApi(),
      localCityData: LocalCityData(),
    );

    getSavedCityUsecase = GetSavedCityUsecase(repository: cityRepository);
  } else {
    cityRepository = CityRepositoryImpl(
      cityDataSource: FakeGeocodingApi(),
      localCityData: LocalCityData(),
    );

    getSavedCityUsecase = GetSavedCityUsecase(repository: cityRepository);
  }
  getIt.registerSingleton<CityCubit>(
    CityCubit(
      getCitiesUseCase: GetCitiesUseCase(repository: cityRepository),
      saveCityUseCase: SaveCityUseCase(repository: cityRepository),
      getSavedCityUsecase: getSavedCityUsecase,
    ),
  );

  //local Data
  getIt.registerSingleton<LocalData>(
    LocalData(getSavedCityUsecase: getSavedCityUsecase),
  );
}
