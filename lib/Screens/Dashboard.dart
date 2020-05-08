import 'dart:convert';

import 'package:covid_19_dashboard/Screens/Tabs/Donation.dart';
import 'package:covid_19_dashboard/Widgets/Header.dart';
import 'package:covid_19_dashboard/Widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

import 'Tabs/Cases.dart';

//
import 'package:http/http.dart' as http;

import 'Tabs/Preventions.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  //
  var scaffoldKey = GlobalKey<ScaffoldState>();

  //
  Map generalData;
  Map countryData;

  List countryList;

  fetchCountryData() async {
    http.Response response = await http.get(
        'https://corona-virus-stats.herokuapp.com/api/v1/cases/countries-search');
    countryData = json.decode(response.body);
    setState(() {
      countryList = countryData["data"]["rows"];
    });
    debugPrint(countryList.toString());
  }

  void fetchGeneralData() async {
    http.Response response = await http.get(
      'https://corona-virus-stats.herokuapp.com/api/v1/cases/general-stats',
    );

    setState(() {
      generalData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    fetchGeneralData();
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // APPBAR SECTION
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            LineAwesomeIcons.home,
            size: Theme.of(context).appBarTheme.iconTheme.size,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(LineAwesomeIcons.search),
            onPressed: () {
              showSearch(context: context, delegate: Search(countryList));
            },
            iconSize: Theme.of(context).appBarTheme.actionsIconTheme.size,
          )
        ],
        bottom: PreferredSize(
          child: Column(
            children: <Widget>[
              HeaderWidget(),
              TabBar(
                controller: _tabController,
                indicatorWeight: 5,
                unselectedLabelColor: Color(0xFF748A9D),
                indicatorPadding: EdgeInsets.all(1),
                indicatorColor: Color(0xFFFFC259),
                labelColor: Colors.black,
                tabs: [
                  Tab(
                    child: Text('Cases', style: TextStyle(fontSize: 18)),
                  ),
                  Tab(
                    child: Text('Symptoms', style: TextStyle(fontSize: 18)),
                  ),
                  Tab(
                    child: Text('Donation', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ],
          ),
          preferredSize: Size.fromHeight(130),
        ),
      ),

      // BODY SECTION

      // HEADER SECTION
      body: TabBarView(
        children: [
          Cases(),
          Preventions(),
          Donation(),
        ],
        controller: _tabController,
      ),
    );
  }
}
