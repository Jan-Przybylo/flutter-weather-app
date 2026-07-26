# Weather app in Flutter

Weather app with featuring weather effects (like [rain](#rain), [thunderstorm](#thunderstorm) etc.) built with Flutter. 

## Contents
- [Features](#features)
- [Technical](#technical)
- [Installation](#installation)
 - [Animations](#animations)
- - [Sunny](#sunny)
- - [Clouds](#clouds)
- - [Rain](#rain)
- - [Thunderstorm](#thunderstorm)

### Preview
![til](./gifs/full.gif)


## Features
- Automatically opens the last selected city
- Animated effects based on current weather
- City search 
- Basic weather information

## Technical
- Built with Flutter
- MVVM architecture
- [openWeather](https://openweathermap.org/) api
- - [Current forecast](https://openweathermap.org/api/current?collection=current_forecast)
- - [5 day weather forecast](https://openweathermap.org/api/forecast5?collection=current_forecast)
- - [Direct geocoding](https://openweathermap.org/api/geocoding-api?collection=other#direct)

## Installation
This project uses [flutter](https://flutter.dev/) framework and [openWeather](https://openweathermap.org/). \
App requires ```.env``` file with:
```
API_KEY=your_api_key
```
You can enable ```debug mode``` to work with test data without ```API_KEY```: 

```dart
// lib/core/constants.dart
...
// uses fake api response if true
const bool debug = true;
...
```
> [!WARNING]
> The ```.env``` **file** is still required and it must be in the root directory (todo)

```
flutter pub get
flutter run
```
## Animations
Animations are handled by ```WeatherEffects``` object.
```dart
class WeatherEffects {
  final WeatherType type;
  WeatherEffects({required this.type});

  WeatherCustomEffect get backgroundEffect {
    return switch(type){
    WeatherType.clear => WeatherClearEffect(),
    WeatherType.rain => WeatherRainEffect(),
    WeatherType.snow => WeatherRainEffect(),
    WeatherType.clouds => WeatherCloudsEffect(),
    WeatherType.thunderstorm => WeatherThunderstormEffect(),
    _ => WeatherThunderstormEffect(),
  }; }
}
```
### Sunny
![til](./gifs/sunny.gif)
### Clouds
![til](./gifs/clouds.gif)
### Rain
![til](./gifs/rain.gif)
### Thunderstorm
![til](./gifs/thunderstorm.gif)


# TODO
 - adaptive layout
 - snow weather effect
 - fix .evn file is required
