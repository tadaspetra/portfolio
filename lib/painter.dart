import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //draw triangle
    Paint linePaint = Paint()
      ..strokeWidth = 10
      ..style = PaintingStyle.fill
      ..color = Colors.grey;
    Path path = Path();
    path.lineTo(300, 0);
    path.lineTo(0, 300);
    path.close();
    canvas.drawPath(path, linePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
