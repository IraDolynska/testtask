import 'package:flutter/material.dart';
import 'package:testtask/components/button.dart';
import 'package:testtask/screens/GameWrapper/index.dart';
import 'package:testtask/services/navigation.dart';

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
                  navigationReset(
                      context,
                      GameWrapper(
                        screen: 'NomScreen',
                      ));
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
