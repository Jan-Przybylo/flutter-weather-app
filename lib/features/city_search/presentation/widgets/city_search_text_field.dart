import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/constants/constants.dart';
import 'package:weather/features/city_search/presentation/cubits/city_cubit.dart';
import 'package:weather/features/city_search/presentation/cubits/city_state.dart';

class CitySearchTextField extends StatefulWidget {
  final Function onSearch;
  const CitySearchTextField({super.key, required this.onSearch});

  @override
  State<CitySearchTextField> createState() => _CitySearchTextFieldState();
}

class _CitySearchTextFieldState extends State<CitySearchTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: CupertinoTextField(
        controller: _controller,
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

  void requestCityQuery() async {
    final String userInput = _controller.text;
    final state = context.read<CityCubit>().state;

    if (userInput.length > 3 && state is! CitySearchLoading) {
      await Future.delayed(Duration(milliseconds: 750)); // wait till typing
      if (_controller.text != userInput || state is CitySearchLoading) return;
      widget.onSearch(userInput);
    }

    await Future.delayed(Duration(seconds: 1));
    if (_controller.text != userInput) requestCityQuery();
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
    _controller.dispose();
    super.dispose();
  }
}
