import 'package:flutter/material.dart';

class CustomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double hight = size.height;
    Path path = Path();

    path.lineTo(0, hight * 0.2);
    path.quadraticBezierTo(width * 0.4, hight, width, hight * 0.8);
    path.lineTo(width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
