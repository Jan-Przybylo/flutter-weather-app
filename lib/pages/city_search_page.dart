
import 'package:flutter/cupertino.dart';
import 'package:weather/core/constants.dart';
import 'package:weather/viewmodels/city_view_model.dart';
import 'package:weather/widgets/city_button_widget.dart';

class CitySearchPage extends StatefulWidget {
  @override
  State<CitySearchPage> createState() => _CitySearchPageState();
}

class _CitySearchPageState extends State<CitySearchPage> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  late CityViewModel vm;

  void search(String value) async {
    final String temp = _controller.text;
    if (_controller.text.length > 3 && !vm.loading) {
      await Future.delayed(Duration(milliseconds: 500)); // wait till typing
      if (_controller.text != temp) return;
      
      vm.loadCities(query: _controller.text);
    }

    await Future.delayed(Duration(seconds: 1));
    if (_controller.text != temp) search(value);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoListSection.insetGrouped(
        header: SafeArea(
          child: Text(
            "Search for a city",
            style: TextStyle(color: CupertinoColors.black),
          ),
        ),
        children: [
          CupertinoTextField(
            controller: _controller,
            focusNode: _focusNode,
            onChanged: (value) {
              search(value);
            },
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
          ListenableBuilder(
            listenable: vm,
            builder: (context, child) {
              if (vm.hasData == false || vm.cities.isEmpty) {
                final message = vm.loading ? "Loading cities" : "Empty list";
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    message,
                    style: TextStyle(color: CupertinoColors.systemGrey2),
                  ),
                );
              }
              return Column(
                children: [
                  for (final city in vm.cities) CityButton(city: city),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
    vm = CityViewModel();
  }
}
