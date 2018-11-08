import 'package:flutter/material.dart';
import 'package:convert/convert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class Notifications extends StatefulWidget {
  Notifications({Key key}) : super(key: key);

  @override
  _NotificationsState createState() => new _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

  @override
  Widget build(BuildContext context) {
    return  new Scaffold(
        appBar: new AppBar(
            title: Row(
              children: <Widget>[
                Text("Notifications"),
              ],
            ),
        ),
        body: Text("")

    );
  }
}
