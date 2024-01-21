import 'package:flutter/material.dart';

class MenuCustom extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var width = size.width;
    var heigth = size.height;
    Path path = Path();
    path.lineTo(width * 0.075, 0);
    path.lineTo(width * 0.075, heigth * 0.3);

    // path.lineTo(width * 0.03, heigth * 0.45);
    path.cubicTo(width * 0.08, heigth * 0.4, width * 0.045, heigth * 0.4,
        width * 0.03, heigth * 0.45);
    path.lineTo(width * 0.03, heigth * 0.55);
    // path.lineTo(width * 0.075, heigth * 0.65);
    path.cubicTo(width * 0.03, heigth * 0.6, width * 0.075, heigth * 0.6,
        width * 0.075, heigth * 0.65);

    path.lineTo(width * 0.075, heigth);
    path.lineTo(width, heigth);
    path.lineTo(width, 0);
    path.lineTo(width * 0.75, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
