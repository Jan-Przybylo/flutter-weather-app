import 'package:flutter/cupertino.dart';
import 'package:weather/core/colors/colors.dart';
import 'package:weather/core/widgets/animated_fake_glass.dart';
import 'package:weather/core/widgets/line.dart';

class WideGlassCard extends StatelessWidget {
  final Widget left, right;
  final String title;
  final IconData? icon;

  const WideGlassCard({
    super.key,
    required this.title,
    required this.left,
    required this.right,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedFakeGlass(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                Line(),
                Row(children: [if (icon != null) Icon(icon, color: white), Text(' $title')]),
                Line(),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: FittedBox(fit: BoxFit.contain, child: left),
                  ),
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: right,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
