
import 'package:flutter/material.dart';

class MyOvalClipper extends CustomClipper<Rect>{
  final double radius;
  final Offset offset;

  MyOvalClipper({this.offset, this.radius});
  @override
  Rect getClip(Size size) {
    
    return Rect.fromCircle(
      center:Offset(0.0, size.height/2)+ offset,
      radius: radius
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {

    return true;
  }
}
