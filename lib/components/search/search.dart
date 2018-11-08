import 'package:flutter/material.dart';
import 'package:convert/convert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => new _SearchState();
}

class _SearchState extends State<Search> {

  @override
  Widget build(BuildContext context) {
    return
      new Scaffold(
        appBar: new AppBar(
            title: new TextField(
              autofocus: true,
              style: new TextStyle(
                color: Colors.white,
              ),
              decoration: new InputDecoration(
                  prefixIcon: new Icon(Icons.search, color: Colors.white),
                  hintText: "Rechercher une personne",
                  hintStyle: new TextStyle(color: Colors.white)),
            )
        ),
        body: Text("hii")

      );

  }
}
