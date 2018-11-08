import 'package:flutter/material.dart';
import 'package:convert/convert.dart';
import 'package:ngessro/components/publicationDetails/PublicationDetails.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class Publication extends StatefulWidget {
  Publication({Key key}) : super(key: key);

  @override
  _WallState createState() => new _WallState();
}

class _WallState extends State<Publication> {

  var _like = false;
  var _dislike = false;

  void like() {
    setState(() {
      _like = true;
      _dislike = false;
    });
  }

  void dislike() {
    setState(() {
      _like = false;
      _dislike = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PublicationDetails()),
          );
        },
        child:
        new Container(
          margin: EdgeInsets.only(top: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Divider(),
              Container(
                margin: EdgeInsets.only(left: 10.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            "https://scontent-mrs1-1.xx.fbcdn.net/v/t1.0-1/p160x160/37784108_10215185798711351_2972047515483897856_n.jpg?_nc_cat=102&_nc_ht=scontent-mrs1-1.xx&oh=3a9c4310c9590e5a4317b394c155df73&oe=5C489D55",
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Nadine Lainceur",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("Consultante IT")
                        ],
                      ),
                    )

                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Container(
                  padding: EdgeInsets.only(
                      left: 10.0, right: 10.0, bottom: 10.0),
                  child: Text(
                    "Le 5 eme mondat c'est de la merde, allez vous faire foutre, lr fils de putes !!!!",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 15.0),
                  )
              ),
              Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Image.network(
                    "http://www.icamge.ch/wp-content/uploads/2015/11/ghani-mahdi2.jpg"
                    )
                ],
              ),
              Container(
                height: 50.0,
                child: Row(
                  children: <Widget>[
                    Expanded(child: Container(
                      child: Icon(Icons.share),
                    )),
                    Expanded(child: Container(
                      child: Icon(Icons.comment),
                    )),
                    Expanded(
                      child: new GestureDetector(
                          onTap: dislike,
                          child: Container(
                            child: Icon(
                                Icons.thumb_down,
                                color: (_dislike) ? Colors.red : null),
                          )),

                    ),

                    Expanded(
                      child: new GestureDetector(
                          onTap: like,
                          child: Container(

                            child: Icon(
                                Icons.thumb_up,
                                color: (_like) ? Colors.blue : null),
                          )),

                    ),
                  ],
                )
                ,)
            ],
          ),

        )
    );
  }
}
