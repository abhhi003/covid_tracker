import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisplayCard extends StatelessWidget {
  final String title;
  final Color color;
  final Color textColor;
  final String total;
  final String today;
  DisplayCard(
      {@required this.title,
      @required this.color,
      @required this.textColor,
      this.today,
      this.total});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding:
            EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
        child: Container(
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(20.0)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    title,
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    total,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 35.0,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    today,
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
