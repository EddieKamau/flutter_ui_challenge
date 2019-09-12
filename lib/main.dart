
import 'dart:ui';

import 'package:challenge_05_01/parts/center_details.dart';
import 'package:challenge_05_01/utils/MyClipper.dart';
import 'package:challenge_05_01/utils/MyPainter.dart';
import 'package:flutter/material.dart';

import 'parts/items_list_modal.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/aliso.jpg"), fit: BoxFit.cover)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 4.0),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: ClipOval(
                  clipper: MyOvalClipper(radius: 150, offset:Offset(40.0, 20.0)),
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/aliso.jpg"), fit: BoxFit.cover)),
                  ),
                ),
              ),
              Align(
              alignment: Alignment.centerLeft,
              child: CustomPaint(
                painter: MyCirclePainter(
                  offset: Offset(40.0, 20.0),
                  radius: 157.0,
                ),
              ),
            ),
            
            Align(
              alignment: Alignment.centerLeft,
              child: CustomPaint(
                painter: MyCirclePainter(
                  offset: Offset(40.0, 20.0),
                  radius: 210.0,
                ),
              ),
            ),

            Align(
              child: ClipOval(
                clipper: MyOvalClipper(radius: 150, offset:Offset(40.0, 20.0)),
                child: CenterDetails()
                ),
            ),

            OptionsListModal(),
            


            ],
          ),
        )
      ),
    );
  }
}

