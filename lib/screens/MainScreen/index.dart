import 'package:flutter/material.dart';
import 'package:testtask/screens/StingNomination/index.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/MainScreen.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: 277,
                height: 172,
                child: Image(
                  image: AssetImage('assets/images/logo.png'),
                ),
              ),
              Container(
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
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => NomScreen()),
                        (Route<dynamic> route) => false);
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
                      fontFamily: 'TypeWriter',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
