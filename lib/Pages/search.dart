import 'package:flutter/material.dart';
import 'package:material_search/material_search.dart';
import 'package:newsapp/Models/article_model.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MaterialSearch<String>(placeholder: 'Search',

    getResults:  (String criteria) async {
      var list = await _fetchList(criteria);
      return list.map((name) => new MaterialSearchResult<String>(
        value: name, //The value must be of type <String>
        text: name, //String that will be show in the list
        icon: Icons.person,
      )).toList();
    },,


    ),);
  }

  _fetchList(String criteria) {


  }
}
