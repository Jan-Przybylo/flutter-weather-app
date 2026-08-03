import 'package:flutter/material.dart';
import 'package:weather/core/colors/colors.dart';

class Line extends StatelessWidget {
  const Line({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(height: 0.5, width: 1000, color: white),
      ),
    );
  }
}
