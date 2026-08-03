// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get searchTitle => 'Wyszukaj miasto';

  @override
  String get searchPlaceholder => 'Wpisz miasto';

  @override
  String get emptyList => 'Empty list';

  @override
  String get forecast => 'Prognoza';

  @override
  String get now => 'Teraz';

  @override
  String get from => 'od';

  @override
  String get to => 'do';

  @override
  String get feelsLike => 'Odczuwalna';

  @override
  String get pressure => 'Ciśnienie';

  @override
  String get windSpeed => 'Prędkość wiatru';

  @override
  String get windDirection => 'Kierunek wiatru';

  @override
  String get cloudiness => 'Zachmurzenie';

  @override
  String get pageNotFound => 'Strona nie została znaleziona!';

  @override
  String get error => 'Błąd';

  @override
  String get emANF => 'Twój klucz API nie istnieje!';

  @override
  String get emS => 'Błąd serwera. Spróbuj ponownie później';
}
