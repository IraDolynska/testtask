import 'package:flutter/material.dart';
import 'package:testtask/components/button.dart';
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
              Btn(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => NomScreen()),
                      (Route<dynamic> route) => false);
                },
                iconFirst: true,
                icon: Icons.play_arrow,
                text: 'New Game',
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
