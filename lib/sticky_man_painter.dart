import 'package:flutter/material.dart';
import 'dart:math' as math;

class StickyManPainter extends CustomPainter {
  final double? legOneSpeed;
  final double? legTwoSpeed;
  final double? manMoveSpeed;

  StickyManPainter({this.legOneSpeed, this.legTwoSpeed, this.manMoveSpeed});

  @override
  void paint(Canvas canvas, Size size) {
    final double originX = size.width / 2.5 + manMoveSpeed!;
    final double originY = size.height / 1.94 + manMoveSpeed!;
    const double unit = 50;

    stickerManPainter(double strokeWidth) => Paint()
      ..strokeWidth = strokeWidth
      ..color = const Color(0xFF6C6E6C)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    //canvas.drawPaint(backPaint);
    //1
    canvas.drawLine(Offset(originX - unit - 20, originY),
        Offset(originX + unit - 20, originY), stickerManPainter(45));

    //2
    canvas.drawLine(Offset(originX + unit - 8, originY),
        Offset(originX + unit - 8, originY + unit + 10), stickerManPainter(20));

    //3
    canvas.drawLine(
        Offset(originX + unit - 8, originY + unit + 10),
        Offset(originX + unit + 40, originY + unit + 10),
        stickerManPainter(20));

    //4
    final joinPoint1 = Offset(
        originX - unit + legOneSpeed! * 2, originY + 80 - legOneSpeed! * 2);
    canvas.drawLine(Offset(originX - unit - 25, originY), joinPoint1,
        stickerManPainter(22));
    canvas.drawLine(
        joinPoint1,
        Offset(originX - unit - 20 + legOneSpeed! * 2,
            originY + 135 - legOneSpeed! * 2),
        stickerManPainter(22));

    //5
    final joinPoint2 = Offset(originX - unit + 55 - legTwoSpeed! * 2,
        originY + 50 + legTwoSpeed! * 2 - 5);
    canvas.drawLine(Offset(originX - unit - 20, originY), joinPoint2,
        stickerManPainter(22));
    canvas.drawLine(
        joinPoint2,
        Offset(originX - unit + 30 - legTwoSpeed! * 2,
            originY + 110 + legTwoSpeed! * 2),
        stickerManPainter(22));

    //head
    canvas.drawCircle(
        Offset(originX + unit + 33, originY - 22), 22, stickerManPainter(20));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

Paint wheelPainter(
        {double? strokeWidth, StrokeCap? strokeCap, PaintingStyle? style}) =>
    Paint()
      ..strokeWidth = strokeWidth ?? 10
      ..color = const Color(0xFF13FFB6)
      ..strokeCap = strokeCap ?? StrokeCap.butt
      ..style = style ?? PaintingStyle.stroke;

const double unit = 50;

double degreesToRadians(double degrees) => math.pi * degrees / 180.0;
