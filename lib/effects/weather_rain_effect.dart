import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:weather/core/constants.dart';
import 'package:weather/effects/weather_effects.dart';

class WeatherRainEffect extends WeatherCustomEffect {
  const WeatherRainEffect({super.key});

  @override
  State<WeatherRainEffect> createState() => _WeatherRainEffectState();

  @override
  Gradient get backgroundGradient => clouds;
}

class _WeatherRainEffectState extends State<WeatherRainEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late List<RainParticle> particles;
  late Size screenSize;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: CustomPaint(painter: RainCanvas(particles: particles)),
    );
  }

  void animateRain() {
    final double speed = RainParticle.speed;
    final double windSpeed = RainParticle.windSpeed;

    final random = Random();

    final w = screenSize.width;
    final h = screenSize.height;

    for (var r in particles) {
      // if rain drop below screen
      final dx = r.position.dy > h
          ? random.nextDouble() * w + 100
          : r.position.dx;

      final dy = r.position.dy > h ? 0 : r.position.dy;

      final pos = Offset(dx + windSpeed, dy + speed);

      r.position = pos;

      setState(() {});
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    screenSize = MediaQuery.sizeOf(context);
    final w = screenSize.width;
    final h = screenSize.height;
    final random = Random();

    particles = List<RainParticle>.generate(
      MAX_PARTICLES,
      (_) => RainParticle(
        position: Offset(
          random.nextDouble() * w + 100,
          random.nextDouble() * h,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _controller.addListener(animateRain);
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();

  }
}

class RainCanvas extends CustomPainter {
  List<RainParticle> particles;
  RainCanvas({required this.particles});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = RainParticle.color;
    paint.strokeWidth = 2.0;
    for (var rainDrop in particles) {
      canvas.drawLine(
        rainDrop.position,
        Offset(rainDrop.position.dx - 1, rainDrop.position.dy + 50.0),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RainParticle {
  RainParticle({required this.position});
  Offset position = Offset(100, 100);
  static const color = RAIN_DROP_COLOR;
  static const speed = RAIN_SPEED;
  static const windSpeed = RAIN_WIND_SPEED;
}
