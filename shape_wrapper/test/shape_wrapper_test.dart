import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:shape_wrapper/shape_wrapper.dart';

void main() {
  testWidgets("Trapezoid widget is shown", (WidgetTester tester) async {
    await tester.pumpWidget(
      const ShapeWrapper(
        shapeType: ShapeType.trapezoid,
        child: SizedBox(
          width: 200,
          height: 100,          
        ),
      ),
    );

    
    expect(find.byWidgetPredicate((widget) => widget is ShapeWrapper && widget.shapeType == ShapeType.trapezoid,), findsOneWidget);
  });
}
