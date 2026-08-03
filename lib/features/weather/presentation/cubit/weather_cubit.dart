import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/domain/entities/city_entity.dart';
import 'package:weather/core/exception/api_exception.dart';
import 'package:weather/core/exception/weather_exception.dart';
import 'package:weather/features/weather/domain/usecases/get_weather.dart';
import 'package:weather/features/weather/presentation/cubit/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit({required this._getWeatherUseCase}) : super(WeatherLoading());
  final GetWeatherUseCase _getWeatherUseCase;

  Future<void> loadData({required CityEntity city}) async {
    if (isClosed) return;
    emit(WeatherLoading());
    try {
      final weather = await _getWeatherUseCase.call(city: city);
      if (isClosed) return;
      emit(WeatherSuccess(weather: weather));
    } on WeatherApiException {
      if (isClosed) return;
      emit(WeatherFailure(exception: WeatherApiException()));
    } on ApiNotFoundException {
      if (isClosed) return;
      emit(WeatherFailure(exception: ApiNotFoundException()));
    }
  }
}
