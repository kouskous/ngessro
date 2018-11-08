import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


import 'package:flutter/material.dart';

import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:ngessro/components/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SideNav extends StatefulWidget {
  SideNav({Key key}) : super(key: key);

  @override
  _SideNavState createState() => new _SideNavState();
}

class _SideNavState extends State<SideNav> {
  String _firstName = "";
  String _lastName = "";
  String _picture = "";

  getFacebookData() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    _firstName = storage.getString('facebook_firstName');
    _lastName = storage.getString('facebook_lastName');
    _picture = storage.getString('facebook_picture');
    return true;
  }


  @override
  void initState() {
    this.getFacebookData().then((result) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountEmail: new Text("bramvbilsen@gmail.com"),
              accountName: new Text(_firstName + " " + _lastName),
              currentAccountPicture: new GestureDetector(
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage(_picture),
                ),
                onTap: () => print("This is your current account."),
              ),
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new NetworkImage(
                          "https://img00.deviantart.net/35f0/i/2015/018/2/6/low_poly_landscape__the_river_cut_by_bv_designs-d8eib00.jpg"),
                      fit: BoxFit.fill
                  )
              ),
            ),
            new ListTile(
              leading:  new Icon(Icons.group),
              title: new Text("Abonnements"),
              onTap: () => Navigator.pop(context),
            ),
            new ListTile(
              leading:  new Icon(Icons.sort),
              title: new Text("Filtres"),
              onTap: () => Navigator.pop(context),
            ),
            new ListTile(
              leading:  new Icon(Icons.perm_identity),
              title: new Text("Mon profil"),
              onTap: () => Navigator.pop(context),
            ),
            new Divider(),
            new ListTile(
              leading:  new Icon(Icons.power_settings_new),
              title: new Text("Se deconnecter"),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ));
  }

}
