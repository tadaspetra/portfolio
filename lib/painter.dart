import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //draw triangle
    final Paint linePaint = Paint()
      ..strokeWidth = 10
      ..style = PaintingStyle.fill
      ..color = Colors.grey;
    final Path path = Path();
    path.lineTo(200, 0);
    path.lineTo(0, 200);
    path.close();
    canvas.drawPath(path, linePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
