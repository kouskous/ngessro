import 'package:flutter/material.dart';
import 'package:convert/convert.dart';
import 'package:ngessro/components/sideav/sidenav.dart';
import 'package:ngessro/components/wall/publication.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class Wall extends StatefulWidget {
  Wall({Key key}) : super(key: key);

  @override
  _WallState createState() => new _WallState();
}

class _WallState extends State<Wall> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title:Text(" Journal")

      ),
      drawer: SideNav(),
      body: Container(
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return Publication();
          },
        ),
      ),


      floatingActionButton: new FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),

    );
  }
}
