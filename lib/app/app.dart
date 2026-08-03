import 'package:flutter/cupertino.dart';
import 'package:weather/app/router/app_router.dart';
import 'package:weather/core/constants/constants.dart';
import 'package:weather/l10n/app_localizations.dart';


class WeatherApp extends StatelessWidget {
  final AppRouter appRouter;
  
  const WeatherApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: debug,
      onGenerateRoute: appRouter.onGenerateRoute,
      onGenerateInitialRoutes: appRouter.onGenerateInitialRoutes,
      theme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(),
        brightness: Brightness.light,
      ),
    );
  }
}
