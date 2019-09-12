
import 'dart:math';

import 'package:challenge_05_01/utils/radial_position.dart';
import 'package:challenge_05_01/utils/sliding_list.dart';
import 'package:flutter/material.dart';

import '../items.dart';

class OptionsListModal extends StatefulWidget {

  @override
  _OptionsListModalState createState() => _OptionsListModalState();
}

class _OptionsListModalState extends State<OptionsListModal> with SingleTickerProviderStateMixin{
  SliddingRadialListController controller;



  List<Widget> optionItems(context){

    int index = 0;
    return options.map((item){
      final optionItem = _radiaListItem(
        item, 
        controller.getItemAngle(index), 
        context
        );
      ++index;
      return optionItem;
    }).toList();
  }

  Widget _radiaListItem(item, angle, context){
    return Transform(
      transform: Matrix4.translationValues(
        40, 
        MediaQuery.of(context).size.height/2 +20, 
        0
      ),
      child: RadialPostion(
        radius: 210,
        angle: angle,
        child: OptionsItem(icon: item['icon'], title: item['title']),
        ),
      );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = SliddingRadialListController(
      vsync: this,
      itemCount: options.length,
    )..open();
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child){
        return Stack(
        children: optionItems(context),
      );
      },
    );
  }
}


class OptionsItem extends StatelessWidget {
  final IconData icon;
  final String title;

  OptionsItem({this.icon, this.title});
  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.translationValues(-30, -30, 0.0),
      child: Row(
        children: <Widget>[
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle, 
              color: Colors.blueGrey,
              border: Border.all(color: Colors.white70, width: 1.5)
            ),
            child: Icon(
              icon,
              size: 40,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14
            ),
          ),
        ],
      ),
    );
  }
}

