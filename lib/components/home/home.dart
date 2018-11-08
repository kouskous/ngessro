import 'package:flutter/material.dart';
import 'package:convert/convert.dart';
import 'package:ngessro/components/wall/publication.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ngessro/components/wall/wall.dart';
import 'package:ngessro/components/search/search.dart';
import 'package:ngessro/components/notifications/notifications.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    new Wall(),
    new Search(),
    new Notifications(),

  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  String _data = "";
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
    return new Scaffold(
      body:_children[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Journal'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.search),
            title: new Text('Rechercher'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              title: Text('Notifications')
          )
        ],
      ),
    );
  }
}
