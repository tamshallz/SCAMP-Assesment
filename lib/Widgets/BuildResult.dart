import 'package:covid_19_dashboard/Widgets/ColorCard.dart';
import 'package:flutter/material.dart';

//
import 'package:covid_19_dashboard/Style/Theme.dart';
import 'package:flutter_dash/flutter_dash.dart';

//
class BuildResult extends StatefulWidget {
  final Map countriesList;
  const BuildResult(
    this.countriesList,
  );

  @override
  _BuildResultState createState() => _BuildResultState();
}

class _BuildResultState extends State<BuildResult>
    with SingleTickerProviderStateMixin {
  get countriesList => widget.countriesList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.pushNamed(context, '/first'),
        ),
        title: Text(
          countriesList["country"],
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Card(
          elevation: 10,
          child: Container(
            color: Colors.black12,
            padding: EdgeInsets.all(10),
            height: 420,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Image.network(
                        countriesList['flag'],
                        height: 150,
                        width: 150,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            countriesList['country'],
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            countriesList["country_abbreviation"],
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // Dotted Divider
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Dash(
                    length: 340,
                    dashColor: Colors.grey,
                  ),
                ),
                // Progress Bar

                ColorCard(
                  number: countriesList["total_recovered"].toString(),
                  text: 'Recovered  ',
                  color: AppTheme.green,
                ),
                ColorCard(
                  number: countriesList["active_cases"].toString(),
                  text: 'Active          ',
                  color: AppTheme.yellow,
                ),
                ColorCard(
                  number: countriesList["total_deaths"].toString(),
                  text: 'Death           ',
                  color: AppTheme.red,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
