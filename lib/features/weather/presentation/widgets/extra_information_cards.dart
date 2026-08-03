import 'package:flutter/cupertino.dart';
import 'package:weather/core/constants/constants.dart';
import 'package:weather/core/widgets/glass_card.dart';
import 'package:weather/core/widgets/wide_glass_card.dart';
import 'package:weather/features/weather/domain/entities/weather_entity.dart';
import 'package:weather/features/weather/presentation/utils/weather_image_mapper.dart';
import 'package:weather/l10n/app_localizations.dart';

class ExtraInformationCards extends StatelessWidget {
  final WeatherEntity weather;
  const ExtraInformationCards({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.0,
      children: [
        Row(
          spacing: 8,
          children: [
            GlassCard(
              title: AppLocalizations.of(context)!.feelsLike,
              text: '${weather.fFeelsLike}$degreeSymbol',
              icon: CupertinoIcons.thermometer,
            ),

            GlassCard(
              title: AppLocalizations.of(context)!.pressure,
              text: '${weather.pressure} hPa',
              icon: CupertinoIcons.speedometer,
            ),
          ],
        ),
        Row(
          spacing: 8,
          children: [
            GlassCard(
              title: AppLocalizations.of(context)!.windSpeed,
              text: '${weather.windSpeed} m/s',
              icon: CupertinoIcons.wind,
            ),
            GlassCard(
              title: AppLocalizations.of(context)!.windDirection,
              text: '${weather.windDeg}$degreeSymbol deg',
              icon: CupertinoIcons.arrow_up_right,
            ),
          ],
        ),
        WideGlassCard(
          title: AppLocalizations.of(context)!.cloudiness,
          left: Text(
            '${weather.cloudinessPercentage}%',
            style: TextStyle(fontWeight: FontWeight.w100),
          ),
          right: WeatherImage.getImage(weather.weatherIcon),
          icon: CupertinoIcons.cloud,
        ),
      ],
    );
  }
}
