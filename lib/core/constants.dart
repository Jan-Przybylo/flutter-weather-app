import 'package:flutter/cupertino.dart';

// uses fake api response if true
const bool debug = true;

const double cardSizeFont = 75.0;
const double largeFont = 20.0;
const double mediumFont = 10.0;

const String degreeSymbol = '\u00B0';

const Gradient clear = LinearGradient(
  begin: Alignment.bottomLeft,
  colors: [CupertinoColors.systemBlue, CupertinoColors.systemTeal],
);

const Gradient clouds = LinearGradient(
  begin: Alignment.bottomLeft,
  colors: [CupertinoColors.tertiarySystemFill, CupertinoColors.systemGrey],
);

const Gradient lightning = LinearGradient(
  begin: Alignment.bottomLeft,
  colors: [CupertinoColors.systemGrey4, CupertinoColors.systemGrey5],
);

//For clarity
// ignore: constant_identifier_names
const RAIN_DROP_COLOR = Color.fromARGB(50, 210, 219, 223);

// ignore: constant_identifier_names
const RAIN_SPEED = 50.0;
// ignore: constant_identifier_names
const RAIN_WIND_SPEED = -5.0;
// ignore: constant_identifier_names
const MAX_PARTICLES = 20;