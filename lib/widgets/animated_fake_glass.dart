import 'package:flutter/cupertino.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

class AnimatedFakeGlass extends StatefulWidget {
  final Widget child;

  const AnimatedFakeGlass({super.key, required this.child});

  @override
  State<AnimatedFakeGlass> createState() => _AnimatedFakeGlassState();
}

class _AnimatedFakeGlassState extends State<AnimatedFakeGlass> {

  double _target = 0.0;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.0, end: _target),
      duration: Duration(milliseconds: 1000),
      curve: Curves.easeIn,
      builder: (context, value, child) {
        return FakeGlass(
          settings: LiquidGlassSettings(
            visibility: value,
            blur: 10,
            glassColor: Color.fromARGB(28, 16, 16, 16),
          ),
          shape: LiquidRoundedSuperellipse(borderRadius: 50),
          child: widget.child,
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _target = 1.0;
    });
  }
}
