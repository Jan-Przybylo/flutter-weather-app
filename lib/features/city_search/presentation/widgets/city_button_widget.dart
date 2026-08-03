import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/domain/entities/city_entity.dart';
import 'package:weather/features/city_search/presentation/cubits/city_cubit.dart';

class CityButton extends StatelessWidget {
  final CityEntity city;
  final bool isSaved;

  const CityButton({super.key, required this.city, this.isSaved = false});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      leading: isSaved
          ? Icon(CupertinoIcons.home, color: CupertinoColors.black)
          : SizedBox.shrink(),
      title: Text(
        city.fullName,
        style: TextStyle(color: CupertinoColors.black),
      ),
      trailing: CupertinoListTileChevron(),
      onTap: () {
        context.read<CityCubit>().saveCity(city: city);
        changeToCity(context, city: city);
      },
    );
  }

  void changeToCity(BuildContext context, {required CityEntity city}) {
    Navigator.of(context).pushNamed('/weathers', arguments: city);
  }
}
