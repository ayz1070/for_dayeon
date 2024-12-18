import 'dart:math';
import 'package:flutter/material.dart';

class SnowBackground extends StatelessWidget {
  const SnowBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SnowPainter(),
      child: Container(), // 전체 화면을 채우기 위한 빈 컨테이너
    );
  }
}

class SnowPainter extends CustomPainter {
  final Random _random = Random();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white; // 눈송이 색상
    for (int i = 0; i < 50; i++) { // 눈송이 개수
      final double x = _random.nextDouble() * size.width; // 랜덤 X 좌표
      final double y = _random.nextDouble() * size.height; // 랜덤 Y 좌표
      final double radius = _random.nextDouble() * 3 + 1; // 눈송이 크기
      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}