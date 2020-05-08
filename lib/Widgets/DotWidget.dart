import 'package:flutter/material.dart';

class DotWidget extends StatelessWidget {
  final String text;
  final Color color;
  const DotWidget({Key key, this.text, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 6),
      child: Row(
        children: <Widget>[
          Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              )),
          SizedBox(width: 3),
          Text(text, style: TextStyle(fontSize: 16),),
        ],
      ),
    );
  }
}
