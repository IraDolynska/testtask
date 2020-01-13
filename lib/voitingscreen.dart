import 'package:flutter/material.dart';
import 'package:testtask/fail.dart';
import 'package:testtask/services/asyncStorage.dart';
import 'dart:convert';
import 'package:testtask/playercont.dart';
import 'dart:async';

import 'package:testtask/success.dart';

class VoteScreen extends StatefulWidget {
  @override
  createState() => new VoteScreenState();
}

class VoteScreenState extends State<VoteScreen> {
  List<String> images = [
    'assets/0.png',
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
    'assets/5.png',
    'assets/6.png'
  ];
  int like = 0;
  int dislike = 0;
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
              if (like > dislike) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SuccessVote()),
                );
              } else
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FailVote()),
                );
            });
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  List players;
  var lead1;

  void initState() {
    super.initState();
    getData();
    startTimer();
  }

  void deactivate() {
    super.deactivate();
    _timer.cancel();
    remover();
    // removeFromAsyncStorage('lead');
    // removeFromAsyncStorage('checkedUsers');
  }

  remover() async {
    await removeFromAsyncStorage('lead');
    await removeFromAsyncStorage('checkedUsers');
  }

  getData() async {
    var data = await getFromAsyncStorage('string', 'lead', true);
    var data2 = await getFromAsyncStorage('string', 'checkedUsers', true);
    setState(() {
      players = data2;
      lead1 = data;
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
        ListView(
          children: [
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
                    margin: EdgeInsets.all(10.0),
                    child: Text(
                      'Round 3: Automobile',
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'PaybAck',
                          color: Color(0xFFce1140)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Text(
                      'sting nomination',
                      style: TextStyle(
                          fontSize: 34,
                          fontFamily: 'PaybAck',
                          color: Colors.white),
                    ),
                  ),
                  Text(
                    'TIMER $_start',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.grey[700],
                        fontFamily: 'PaybAck',
                        ),
                  ),
                  lead1 != null
                      ? Container(
                          margin: EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'LEADER',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                margin: EdgeInsets.all(10.0),
                                child: Image(
                                  image: AssetImage(lead1["avatar"]),
                                  width: 45,
                                  height: 45,
                                ),
                              ),
                              Text(
                                lead1["name"],
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          alignment: Alignment.center,
                          child: new CircularProgressIndicator(
                            valueColor: new AlwaysStoppedAnimation<Color>(
                                Color(0xFFf44336)),
                          ),
                        ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Text(
                      'OPERATORS',
                      style: TextStyle(
                        fontFamily: 'PaybAck',
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  players != null
                      ? Wrap(
                          children: players
                              .map((item) => PlayersContnr(
                                    avatar: item["avatar"],
                                    name: item["name"],
                                  ))
                              .toList())
                      : Container(
                          alignment: Alignment.center,
                          child: new CircularProgressIndicator(
                            valueColor: new AlwaysStoppedAnimation<Color>(
                                Color(0xFFf44336)),
                          ),
                        ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(20.0),
                        height: 117,
                        width: 117,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF007856),
                              spreadRadius: 2,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                          child: RaisedButton.icon(
                            onPressed: () {
                            setState(() {
                              ++like;
                            });
                          },
                          icon: Icon(
                            Icons.thumb_up,
                            color: Colors.white,
                            size: 50,
                          ),
                          label: Text(''),
                          shape: CircleBorder(),
                          color: Color.fromRGBO(0, 138, 99, 1),
                          ),
                        ),
                        Positioned(
                          right: 15,
                          top: 15,
                          child:Container(
                          width: 43,
                            height: 43,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF505050),
                            ),
                            child: Center(
                              child: Text(
                                "$like",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontFamily: 'PaybAck'
                                ),
                              ),
                            ),
                            ),
                        ),
                      ],
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(20.0),
                        height: 117,
                        width: 117,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(123, 7, 37, 1),
                              spreadRadius: 2,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                          child: RaisedButton.icon(
                            onPressed: () {
                            setState(() {
                              ++dislike;
                            });
                          },
                          icon: Icon(
                            Icons.thumb_down,
                            color: Colors.white,
                            size: 50,
                          ),
                          label: Text(''),
                          shape: CircleBorder(),
                          color: Color.fromRGBO(206, 17, 65, 1),
                          ),
                        ),
                        Positioned(
                          right: 15,
                          top: 15,
                          child:Container(
                          width: 43,
                            height: 43,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF505050),
                            ),
                            child: Center(
                              child: Text(
                                "$dislike",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontFamily: 'PaybAck'
                                ),
                              ),
                            ),
                            ),
                        ),
                      ],
                    ),

                  ],
                  ),
                  
                  
                ],
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
