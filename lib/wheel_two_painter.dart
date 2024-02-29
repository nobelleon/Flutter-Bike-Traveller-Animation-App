import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'sticky_man_painter.dart';

class WheelTwoPainter extends CustomPainter {
  final double? speed;
  final double? wheelShake;

  WheelTwoPainter({this.speed, this.wheelShake});

  @override
  void paint(Canvas canvas, Size size) {
    final double originX = size.width / 1.3;
    final double originY = size.height / 2 + wheelShake!;

    //smallest wheel on the left
    final wheelCenterX = originX - unit - 35;
    final wheelCenterY = originY + 158;
    final wheelCenter = Offset(wheelCenterX, wheelCenterY);

    canvas.drawCircle(wheelCenter, 11, wheelPainter(style: PaintingStyle.fill));

    //wheel border
    canvas.drawCircle(wheelCenter, 65, wheelPainter());

    final arcRect = Rect.fromCircle(center: wheelCenter, radius: 40);
    final startAngle = degreesToRadians(0) * math.tan(speed!);
    final sweepAngle = degreesToRadians(60) * math.tan(speed!);
    canvas.drawArc(
        arcRect,
        startAngle,
        sweepAngle,
        true,
        wheelPainter(
            strokeCap: StrokeCap.round,
            strokeWidth: 7,
            style: PaintingStyle.fill));

    final startAngle2 = degreesToRadians(180) * math.tan(speed!);
    final sweepAngle2 = degreesToRadians(-60) * math.tan(speed!);
    canvas.drawArc(
        arcRect,
        startAngle2,
        sweepAngle2,
        true,
        wheelPainter(
            strokeCap: StrokeCap.round,
            strokeWidth: 7,
            style: PaintingStyle.fill));

    final startAngle3 = degreesToRadians(-60) * math.tan(speed!);
    final sweepAngle3 = degreesToRadians(-60) * math.tan(speed!);
    canvas.drawArc(
        arcRect,
        startAngle3,
        sweepAngle3,
        true,
        wheelPainter(
            strokeCap: StrokeCap.round,
            strokeWidth: 7,
            style: PaintingStyle.fill));

    //lines
    //canvas.drawLine(wheelCenter, Offset(wheelCenterX+65*math.cos(speed!), wheelCenterY+65*math.sin(speed!)), wheelPainter());

    //canvas.drawLine(wheelCenter, Offset(wheelCenterX-60*math.sin(speed!), wheelCenterY+70*math.cos(speed!)), wheelPainter());

    //canvas.drawLine(wheelCenter, Offset(wheelCenterX+70*math.sin(speed!), wheelCenterY-55*math.cos(speed!)), wheelPainter());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
