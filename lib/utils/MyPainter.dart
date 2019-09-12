
import 'dart:math';

import 'package:flutter/material.dart';

class MyCirclePainter extends CustomPainter{
  final Offset offset;
  final double radius;

  MyCirclePainter({this.radius, this.offset});
  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;
    Paint paint = Paint()
          ..strokeCap = StrokeCap.butt
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5
          ..color = Colors.white70;


    Offset center = Offset(0.0, height/2)+ offset;

    canvas.drawArc(
        new Rect.fromCircle(center: center,radius: radius),
        -pi/2,
        2*pi,
        false,
        paint
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}
 