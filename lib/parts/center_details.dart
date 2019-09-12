import 'package:flutter/material.dart';

class CenterDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "CITY OF",
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w400
          ),
        ),
        
        Text(
          "ALISO VIEJO",
          style: TextStyle(
            color: Colors.white,
            fontSize: 27,
            fontWeight: FontWeight.w500
          ),
        ),
        Divider(color: Colors.white70,),
        Text(
          "Wednesday",
          style: TextStyle(
            color: Colors.white,
            fontSize: 12.5,
            fontWeight: FontWeight.w300
          ),
        ),
        Text(
          "January 15, 2013",
          style: TextStyle(
            color: Colors.white,
            fontSize: 12.5,
            fontWeight: FontWeight.w300
          ),
        ),
        Divider(color: Colors.white70,),
        Row(
          children: <Widget>[
            Text(
              "50",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w300
              ),
            ),
            SizedBox(width: 10),
            Icon(Icons.wb_sunny, color: Colors.white,)
          ],
        ),
        
      ],
    );
  }
}