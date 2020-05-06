import 'package:flutter/material.dart';

//
import 'package:url_launcher/url_launcher.dart';

class Donation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: _launchURL,
              child: Text('Donate'),
            ),
          ],
        ),
      ),
    );
  }
}

_launchURL() async {
  const url = 'https://covid19responsefund.org/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
