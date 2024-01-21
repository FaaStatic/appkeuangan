import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LineDotted extends CustomPainter {
  late Paint _paint;
  LineDotted() {
    _paint = Paint();
    _paint.color = HexColor("#C1DDED");
    _paint.strokeWidth = 1;
    _paint.strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (double i = 0; i < 120; i = i + 15) {
      if (i % 3 == 0) {
        canvas.drawLine(Offset(i, 0.0), Offset(i + 3, 0.0), _paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
