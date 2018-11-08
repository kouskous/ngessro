import 'package:flutter/material.dart';
import 'package:ngessro/components/login/login.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Ngessro',
      theme: new ThemeData(
        primaryColor: Color(0xFF1db954),
        accentColor: Color(0xFF191414),
      ),
      home: new Login(),
    );
  }
}

