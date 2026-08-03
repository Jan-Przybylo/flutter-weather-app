import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/di/dependency_injection.dart';
import 'package:weather/features/city_search/presentation/cubits/city_cubit.dart';
import 'package:weather/features/city_search/presentation/views/city_search_view.dart';

class CitySearchPage extends StatelessWidget {
  const CitySearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //lazy: false, //TODO dowiedziec sie
      create: (context) => getIt<CityCubit>()..loadSavedCity(),
      child: CitySearchView(),
    );
  }
}

// CupertinoPageScaffold(
//       child: CupertinoListSection.insetGrouped(
//         header: SafeArea(
//           child: Text(
//             "Search for a city",
//             style: TextStyle(color: CupertinoColors.black),
//           ),
//         ),
//         children: [
//           CupertinoTextField(
//             onChanged: (value) {
//               // search(value);
//             },
//             padding: EdgeInsetsGeometry.all(8.0),
//             style: TextStyle(fontSize: largeFont, color: CupertinoColors.black),
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: CupertinoColors.lightBackgroundGray,
//                 width: 1,
//               ),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             suffix: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: const Icon(
//                 CupertinoIcons.search,
//                 color: CupertinoColors.systemFill,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );


// ListenableBuilder(
          //   listenable: vm,
          //   builder: (context, child) {
          //     if (vm.hasData == false || vm.cities.isEmpty) {
          //       final message = vm.loading ? "Loading cities" : "Empty list";
          //       return Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Text(
          //           message,
          //           style: TextStyle(color: CupertinoColors.systemGrey2),
          //         ),
          //       );
          //     }
          //     return Column(
          //       children: [
          //         for (final city in vm.cities) CityButton(city: city),
          //       ],
          //     );
          //   },
          // ),