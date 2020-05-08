import 'package:flutter/material.dart';

//IN APP IMPORT
import 'package:covid_19_dashboard/Style/Theme.dart';

//

class ColorCard extends StatelessWidget {
  final String number;
  final String text;
  final Color color;

  const ColorCard({
    Key key,
    this.number,
    this.text,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: Container(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: <Widget>[
                ColorDot(
                  color: color,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Container(
                    child: Text(
                      text,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.defaultBlack),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 110),
                  child: Text(
                    number,
                    style: TextStyle(
                      fontSize: 18,
                      color: AppTheme.defaultBlack,
                      fontWeight: FontWeight.w500,
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

class ColorDot extends StatelessWidget {
  final Color color;
  const ColorDot({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(5),
            )),
      ],
    );
  }
}
