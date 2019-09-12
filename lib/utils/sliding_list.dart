import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class SliddingRadialListController extends ChangeNotifier{

  final firstItemAngle = -pi/3;
  final lastItemAngle = pi/3;
  final startSlidingAngle = 3*pi/4;

  final AnimationController _slideController;
  final int itemCount;
  final List<Animation<double>> _slidePosition;

  SliddingRadialListController({this.itemCount, vsync}): _slideController = AnimationController(
    duration: Duration(milliseconds: 1500),
    vsync: vsync,
  ),
  _slidePosition = []
  {
    _slideController
    ..addListener(() => notifyListeners())
    ..addStatusListener((AnimationStatus status){
      switch (status) {
        case AnimationStatus.forward:
        _state = RadialListState.openning;
        notifyListeners();          
          break;
          case AnimationStatus.completed:
            _state = RadialListState.open;
            notifyListeners(); 
            break;
            case AnimationStatus.reverse:
            case AnimationStatus.dismissed:
            break;
      }
    });

    final delayInterval = 0.1;
    final slideInterval = 0.4;
    final angleDeltaPerItem = (lastItemAngle - firstItemAngle) /(itemCount - 1);
    for (int i=0; i< itemCount; ++i){
      final start = delayInterval * i;
      final end = start + slideInterval;

      final endSlidingAngle = firstItemAngle + (angleDeltaPerItem * i);

      _slidePosition.add(
        Tween(
          begin: startSlidingAngle,
          end: endSlidingAngle,
        ).animate(
          CurvedAnimation(
            parent: _slideController,
            curve: Interval(start, end, curve: Curves.easeInOut)
          )
        )
      );
    }

  }

  RadialListState _state;


  double getItemAngle(int index){
    return _slidePosition[index].value;

  }

  open(){
    _slideController.forward();
  }
}

enum RadialListState{
  open,
  openning
}