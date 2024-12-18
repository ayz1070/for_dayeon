import 'dart:math';

import 'package:flutter/material.dart';

class SnowfallEffect extends StatefulWidget {
  const SnowfallEffect({Key? key}) : super(key: key);

  @override
  State<SnowfallEffect> createState() => _SnowfallEffectState();
}

class _SnowfallEffectState extends State<SnowfallEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Snowflake> _snowflakes;

  final int _numberOfSnowflakes = 100; // 눈송이 개수

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(); // 애니메이션 반복

    _snowflakes = List.generate(_numberOfSnowflakes, (_) => Snowflake());

    // AnimationController가 갱신될 때마다 눈송이 업데이트
    _controller.addListener(() {
      for (var snowflake in _snowflakes) {
        snowflake.update();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SnowfallPainter(_snowflakes),
      child: Container(), // 전체 화면을 채우는 빈 컨테이너
    );
  }
}

// 눈송이 데이터 모델
class Snowflake {
  double x, y, size, speed;
  final Random _random = Random();

  Snowflake()
      : x = Random().nextDouble() * 400,
        y = Random().nextDouble() * 800,
        size = Random().nextDouble() * 3 + 2, // 눈송이 크기 (2~5)
        speed = Random().nextDouble() * 2 + 1; // 눈송이 속도 (1~3)

  void update() {
    y += speed; // 아래로 이동
    if (y > 800) {
      y = 0; // 화면 끝에 도달하면 위로 리셋
      x = _random.nextDouble() * 400; // X 위치 랜덤 재설정
    }
  }
}

// 눈송이를 그리는 Painter
class SnowfallPainter extends CustomPainter {
  final List<Snowflake> snowflakes;

  SnowfallPainter(this.snowflakes);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;

    for (var snowflake in snowflakes) {
      canvas.drawCircle(Offset(snowflake.x, snowflake.y), snowflake.size, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}