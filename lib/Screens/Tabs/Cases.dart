import 'package:covid_19_dashboard/Style/Theme.dart';
import 'package:covid_19_dashboard/Widgets/ColorCard.dart';
import 'package:flutter/material.dart';

import 'package:pie_chart/pie_chart.dart';

//
import 'package:http/http.dart' as http;
import 'dart:convert';

class Cases extends StatefulWidget {
  @override
  _CasesState createState() => _CasesState();
}

class _CasesState extends State<Cases> {
  //
  Map countryData;

  List countryList;
  //
  var scaffoldKey = GlobalKey<ScaffoldState>();

  // JSON data

  static Map generalData;

  void fetchGeneralData() async {
    http.Response response = await http.get(
        'https://corona-virus-stats.herokuapp.com/api/v1/cases/general-stats');

    setState(() {
      generalData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchGeneralData();
    dataMap.putIfAbsent("Active Cases", () => 60);
    dataMap.putIfAbsent("Closed", () => 82);
    dataMap.putIfAbsent("Death", () => 18);
    super.initState();
  }

  // Dispose(),

  //
  Map<String, double> dataMap = Map();

  List<Color> colorList = [
    AppTheme.yellow,
    AppTheme.green,
    AppTheme.red,
  ];

  @override
  Widget build(BuildContext context) {
    return generalData == null
        ? Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            body: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      child: Center(
                          child: PieChart(
                        dataMap: dataMap,
                        animationDuration: Duration(milliseconds: 800),
                        chartLegendSpacing: 40.0,
                        chartRadius: MediaQuery.of(context).size.width,
                        showChartValuesOutside: false,
                        colorList: colorList,
                        legendPosition: LegendPosition.right,
                        decimalPlaces: 0,
                        initialAngle: 0,
                        chartValueStyle: defaultChartValueStyle.copyWith(
                          color: Colors.blueGrey[900].withOpacity(0.9),
                        ),
                        chartType: ChartType.disc,
                      )),
                    ),
                    Card(
                      elevation: 5,
                      child: Container(
                          height: 85,
                          width: 365,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 25, top: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'TOTAL CASES',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  generalData["data"]["total_cases"].toString(),
                                  style: TextStyle(
                                    fontSize: 40,
                                    color: AppTheme.purple,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),

                    //
                    SizedBox(height: 10),

                    Container(
                      child: Column(
                        children: <Widget>[
                          ColorCard(
                            number: generalData["data"]["currently_infected"]
                                .toString(),
                            text: 'Active Cases ',
                            color: AppTheme.yellow,
                          ),
                          ColorCard(
                            number: generalData["data"]["recovery_cases"]
                                .toString(),
                            text: 'Closed Cases',
                            color: AppTheme.green,
                          ),
                          ColorCard(
                            number:
                                generalData["data"]["death_cases"].toString(),
                            text: 'Death Cases  ',
                            color: AppTheme.red,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
