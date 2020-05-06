import 'package:covid_19_dashboard/Style/Theme.dart';
import 'package:flutter/material.dart';

//
import 'package:http/http.dart' as http;
import 'dart:convert';

//

class HeaderWidget extends StatefulWidget {
  //
  final String countryName;
  final String image;

  const HeaderWidget({Key key, this.countryName, this.image}) : super(key: key);

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  //
  Map generalData;

  List countryList;

  fetchCountryData() async {
    http.Response response = await http.get(
        'https://corona-virus-stats.herokuapp.com/api/v1/cases/countries-search');

    generalData = json.decode(response.body);
    setState(() {
      countryList = generalData['data']['rows'];
    });
    debugPrint(countryList.toString());
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }

  String selectedCountry = 'USA';
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
            radius: 25,
            backgroundImage: NetworkImage(
              'https://static.toiimg.com/photo/72975551.cms',
            ),
          ),
        ],
      ),
    );
  }
}
