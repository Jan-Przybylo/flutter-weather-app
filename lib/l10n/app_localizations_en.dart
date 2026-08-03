// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get searchTitle => 'Search for a city';

  @override
  String get searchPlaceholder => 'Enter the city';

  @override
  String get emptyList => 'Empty list';

  @override
  String get forecast => 'Forecast';

  @override
  String get now => 'Now';

  @override
  String get from => 'from';

  @override
  String get to => 'to';

  @override
  String get feelsLike => 'Feels like';

  @override
  String get pressure => 'Pressure';

  @override
  String get windSpeed => 'Wind speed';

  @override
  String get windDirection => 'Wind direction';

  @override
  String get cloudiness => 'Cloudiness';
}
