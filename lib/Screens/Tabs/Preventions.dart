import 'package:flutter/material.dart';

//

class Preventions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text(
              'Symptoms',
              style: TextStyle(fontSize: 25),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Card(
              child: Image.asset('assets/images/sym.png', height: 280),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text(
              'Preventions',
              style: TextStyle(fontSize: 25),
            ),
          ),
          Card(
            elevation: 20,
            child: Image.asset('assets/images/Prevention.png'),
          )
        ],
      ),
    );
  }
}
