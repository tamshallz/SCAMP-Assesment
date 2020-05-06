import 'package:covid_19_dashboard/Style/Theme.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Image.asset(
              ImageData.welcomeImage,
              height: 400,
            ),
            Text(
              StringsData.welcomeTitleString,
              style: StringsData.boldFont,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                StringsData.welcomeString,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            // Learn More Button
            InkWell(
              onTap: () => Navigator.pushNamed(context, '/first'),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: AppTheme.buttonBlack,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    StringsData.welcomeButtonString,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.body2.color,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
