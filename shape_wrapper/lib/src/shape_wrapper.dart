import 'package:flutter/material.dart';
import 'trapezoid_clipper.dart';

enum ShapeType {
  trapezoid,
  // Add more shapes as needed
}

class ShapeWrapper extends StatelessWidget {
  const ShapeWrapper({
    super.key,
    required this.shapeType,
    this.child,
    this.points,
  });

  final ShapeType shapeType;
  final Widget? child;
  final ({Offset topLeft, Offset bottomLeft, Offset bottomRight, Offset topRight})? points;


  CustomClipper<Path>? get clipper => switch (shapeType) {
        ShapeType.trapezoid => points != null ? TrapezoidClipper(points: points!) : TrapezoidClipper(),
      };

  @override
  Widget build(BuildContext context) {
    return ClipPath(      
      clipper: clipper,    
      child: child,      
    );
  }
}


