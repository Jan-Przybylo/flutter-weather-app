import 'package:flutter/cupertino.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'package:weather/core/constants/animation_duration.dart';
import 'package:weather/core/settings/glass_settings.dart';

class AnimatedFakeGlass extends StatefulWidget {
  final Widget child;

  const AnimatedFakeGlass({super.key, required this.child});

  @override
  State<AnimatedFakeGlass> createState() => _AnimatedFakeGlassState();
}


class _AnimatedFakeGlassState extends State<AnimatedFakeGlass> {
  // Number of children
  static int index = 1;
  double _target = 0.0;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.0, end: _target),
      duration: pageOpacityAnimationDuration,
      curve: curveTypeSetting,
      builder: (context, value, child) {
        return FakeGlass(
          settings: LiquidGlassSettings(
            visibility: value,
            blur: blurSetting,
            glassColor: glassColorSetting,
          ),
          shape: LiquidRoundedSuperellipse(borderRadius: borderRadiusSetting),
          child: widget.child,
        );
      },
    );
  }

  Future<void> animate() async {
    //delay between every widget of this type
    await Future.delayed(Duration(milliseconds: ++index * opacityDelay));

    if(!mounted) return;
    setState(() {
      _target = 1.0;
    });
  }

  @override
  void initState() {
    super.initState();
    animate();
  }
  @override
  void dispose() {
    index = 0;
    super.dispose();
  }
}
