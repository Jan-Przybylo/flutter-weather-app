import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:weather/core/constants/constants.dart';
import 'package:weather/l10n/app_localizations.dart';

class CitySearchTextField extends StatefulWidget {
  final Function onSearch;
  const CitySearchTextField({super.key, required this.onSearch});

  @override
  State<CitySearchTextField> createState() => _CitySearchTextFieldState();
}

class _CitySearchTextFieldState extends State<CitySearchTextField> {
  final TextEditingController _controller = TextEditingController();
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: CupertinoTextField(
        controller: _controller,
        placeholder: AppLocalizations.of(context)!.searchPlaceholder,
        padding: EdgeInsetsGeometry.all(8.0),
        style: TextStyle(fontSize: largeFont, color: CupertinoColors.black),
        decoration: BoxDecoration(
          border: Border.all(
            color: CupertinoColors.lightBackgroundGray,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        suffix: Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Icon(
            CupertinoIcons.search,
            color: CupertinoColors.systemFill,
          ),
        ),
      ),
    );
  }

  void requestCityQuery() {
    _timer?.cancel();
    final userInput = _controller.text;
    if (userInput.length > 3) {
      _timer = Timer(debouncerDuration, () => widget.onSearch(userInput));
    }
  }

  @override
  void initState() {
    _controller.addListener(() {
      requestCityQuery();
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }
}
