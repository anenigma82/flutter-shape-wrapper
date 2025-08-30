import 'package:flutter/material.dart';

class TrapezoidClipper extends CustomClipper<Path> {
  const TrapezoidClipper({
    this.points = const (
      topLeft: Offset(0, 5),
      bottomLeft: Offset(10, 0),
      bottomRight: Offset(0, 10),
      topRight: Offset(10, double.infinity),
    ),
  });
  
  final ({Offset topLeft, Offset bottomLeft, Offset bottomRight, Offset topRight}) points;

  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;

    final path = Path();
    path.moveTo(getValueFromPoint(points.topLeft.dx, w), getValueFromPoint(points.topLeft.dy, h));
    path.lineTo(getValueFromPoint(points.bottomLeft.dx, w), h - getValueFromPoint(points.bottomLeft.dy, h));
    path.lineTo(w - getValueFromPoint(points.bottomRight.dx, w), h - getValueFromPoint(points.bottomRight.dy, h));
    path.lineTo(w - getValueFromPoint(points.topRight.dx, w), h - getValueFromPoint(points.topRight.dy, h));
    path.close();
    return path;
  }

  double getValueFromPoint(double value, double max) {    
     return value.isInfinite ? max : value;          
  }

  @override
  bool shouldReclip(TrapezoidClipper oldClipper) => false;
}