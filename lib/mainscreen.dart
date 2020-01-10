import 'package:flutter/material.dart';
import 'package:testtask/nomscreen.dart';

class MainScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/MainScreen.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(65.0, 480.0, 50.0, 65.0),
          width: 274,
          height: 60,
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
              color: Color(0xFF7b0725),
              width: 5.0,
            )),
          ),
          child: RaisedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NomScreen()),
              );
            },
            color: Color(0xFFce1140),
            icon: Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 28.0,
            ),
            label: Text(
              'New Game',
              style: TextStyle(
                color: Colors.white,
                fontSize: 21.0,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
