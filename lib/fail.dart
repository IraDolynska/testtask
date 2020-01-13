import 'package:flutter/material.dart';
import 'package:testtask/nomscreen.dart';
import 'dart:async';

class FailVote extends StatefulWidget {
  @override
  createState() => FailVoteState();
}

class FailVoteState extends State<FailVote> {

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
            setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NomScreen()));
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


void deactivate(){
  super.deactivate();
  _timer.cancel();
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
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 5.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: images
                        .map((item) => Image(
                            image: AssetImage(item), width: 45, height: 45))
                        .toList()),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 30, 0, 30),
                child: Image(
                  image: AssetImage('assets/fail.png'),
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
                      fontSize: 24,
                      fontFamily: 'PaybAck',
                    ),
                  ),
                  Text(
                    "$_start",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 80,
                      fontFamily: 'PaybAck',
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