import 'package:flutter/cupertino.dart';
import 'package:weather/core/colors/colors.dart';
import 'package:weather/l10n/app_localizations.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(),
      backgroundColor: white,
      child: Center(
        child: Text(AppLocalizations.of(context)!.pageNotFound),
      ),
    );
  }
}
