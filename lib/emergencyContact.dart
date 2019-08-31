import 'dart:async';

import 'package:flutter/material.dart';

class ListViewCard extends StatelessWidget {
  List<String> _listViewData = [
    "A List View with many Text - Here's one!",
    "A List View with many Text - Here's another!",
    "A List View with many Text - Here's more!",
    "A List View with many Text - Here's more!",
    "A List View with many Text - Here's more!",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView in Card Example'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 250,
            child: Card(
              elevation: 3.0,
              child: ListView(
                padding: EdgeInsets.all(8.0),
                //map List of our data to the ListView
                children: _listViewData
                    .map((data) => ListTile(title: Text(data)))
                    .toList(),
              ),
            ),
          ),
          SizedBox(height: 15.0),
          Container(
            height: 250,
            child: Card(
              elevation: 3.0,
              child: ListView(
                padding: EdgeInsets.all(8.0),
                //map List of our data to the ListView
                children: _listViewData
                    .map((data) => ListTile(title: Text(data)))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}