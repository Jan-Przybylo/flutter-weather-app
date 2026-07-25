import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

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
