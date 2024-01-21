import 'package:flutter/material.dart';

class CustomShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var width = size.width;
    var height = size.height;
    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(width * 0.35, 0);
    path.quadraticBezierTo(width * 0.45, 6, width * 0.45, 35);
    path.quadraticBezierTo(width * 0.45, 60, width * 0.55, 55);
    path.quadraticBezierTo(width * 0.61, 55, width * 0.61, 40);
    path.quadraticBezierTo(width * 0.61, 6, width * 0.7, 0);

    path.lineTo(width * 0.6, 0);
    path.lineTo(width, 0);
    path.lineTo(width, height);
    path.lineTo(0, height);
    path.lineTo(0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
