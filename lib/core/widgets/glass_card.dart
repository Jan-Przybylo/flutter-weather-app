import 'package:flutter/cupertino.dart';
import 'package:weather/core/colors/colors.dart';
import 'package:weather/core/widgets/animated_fake_glass.dart';
import 'package:weather/core/widgets/line.dart';

class GlassCard extends StatelessWidget{
  final String title, text;
  final IconData? icon;
  const GlassCard({super.key, required this.title, required this.text, this.icon});


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedFakeGlass(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: AspectRatio(
            aspectRatio: 1.0,
            child: Column(
              children: [
                Row(children: [Line(), Row(
                  children: [
                    if(icon != null) Icon(icon, color: white),
                    Text(' $title'),
                  ],
                ), Line()]),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        text,
                        style: TextStyle(fontWeight: FontWeight.w100),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}