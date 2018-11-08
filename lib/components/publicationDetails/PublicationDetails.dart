import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


import 'package:flutter/material.dart';

import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:ngessro/components/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PublicationDetails extends StatefulWidget {
  PublicationDetails({Key key}) : super(key: key);

  @override
  _PublicationDetailsState createState() => new _PublicationDetailsState();
}

class _PublicationDetailsState extends State<PublicationDetails> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: InkWell(
                child: Icon(Icons.arrow_back),
                onTap: () {
                  Navigator.pop(context);
                }
            )
            ,
            backgroundColor: Colors.black,
          ),
          body: Container(
            color: Colors.black,
          )
      ),
    );
  }
}
