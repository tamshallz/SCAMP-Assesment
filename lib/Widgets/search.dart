import 'package:covid_19_dashboard/Widgets/BuildResult.dart';
import 'package:flutter/material.dart';

//

class Search extends SearchDelegate {
  List countriesList;

  Search(this.countriesList);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? countriesList
        : countriesList
            .where((element) =>
                element['country'].toString().toLowerCase().startsWith(query))
            .toList();

    // return Container();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {
              showResults(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BuildResult(suggestionList[index]),
                  ));
            },
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(suggestionList[index]['flag']),
            ),
            title: RichText(
              text: TextSpan(
                  text: suggestionList[index]['country']
                      .substring(0, query.length),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: suggestionList[index]['country']
                          .substring(query.length),
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    )
                  ]),
            ),
          ),
        );
      },
    );
  }
}
