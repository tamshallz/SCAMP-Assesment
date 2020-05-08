import 'package:covid_19_dashboard/Style/Theme.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            StringsData.welcomeTitleString,
            style: StringsData.semiBoldFont,
          ),

          //
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(
              'assets/images/logo.png',
            ),
          ),
        ],
      ),
    );
  }
}
