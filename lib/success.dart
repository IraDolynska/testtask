import 'package:flutter/material.dart';
import 'dart:async';

import 'package:testtask/mainscreen.dart';

class SuccessVote extends StatefulWidget {
  @override
  createState() => SuccessVoteState();
}

class SuccessVoteState extends State<SuccessVote> {
  List<String> images = [
    'assets/0.png',
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
    'assets/5.png',
    'assets/6.png'
  ];
Timer _timer;
  int _start = 15;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
            setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen()));
            });
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }
  void initState() {
    super.initState();
    setState(() {
      startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/StingNominationScreen.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: images
                        .map((item) => Image(
                            image: AssetImage(item), width: 45, height: 45))
                        .toList()),
              ),
              Container(
                child: Image(
                  image: AssetImage('assets/succs.png'),
                  width: 285.5,
                  height: 86,
                ),
              ),
              Column(
                children: <Widget>[
                  Text(
                    "Sting begins in...",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "$_start",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),


            ],
          ),
        ),
      ],
    ));
  }
}