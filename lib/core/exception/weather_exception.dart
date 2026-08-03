class WeatherApiException implements Exception{
  final Object? error; 
  WeatherApiException([this.error]);
}
