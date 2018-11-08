import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


import 'package:flutter/material.dart';

import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:ngessro/components/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoggedIn = false;

  void onLoginStatusChanged(bool isLoggedIn) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
    });
  }

  void initiateFacebookLogin() async {
    var facebookLogin = FacebookLogin();
    var facebookLoginResult = await facebookLogin.logInWithReadPermissions(
        ['email']);
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        print("Error");
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("CancelledByUser");
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.loggedIn:
        print("logged in");
        onLoginStatusChanged(true);
        var graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=picture.height(200),first_name,last_name,email&access_token=${facebookLoginResult
                .accessToken.token}');

        var profile = json.decode(graphResponse.body);
        SharedPreferences storage = await SharedPreferences.getInstance();
        storage.setString("facebook_firstName", profile['first_name']);
        storage.setString("facebook_lastName", profile['last_name']);
        storage.setString("facebook_picture", profile['picture']['data']['url']);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(color: Colors.redAccent),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 50.0,
                            child: Icon(
                              Icons.chat,
                              color: Colors.blue,
                              size: 50.0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0),
                          ),
                          Text(
                            "Ngessro",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24.0),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 100.0),
                          ),
                          MaterialButton(
                            color: Colors.indigo,
                            textColor: Colors.white,
                            onPressed: initiateFacebookLogin,
                            child: Text("Continuer avec Facebook"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )

    );
  }
}
