import 'package:flutter/material.dart';

import 'sticky_man_painter.dart';

class RoadPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
        Offset(-200, size.height * 0.7),
        Offset(size.width * 1.5, size.height * 0.71),
        wheelPainter(strokeWidth: 6));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
