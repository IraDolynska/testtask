import 'package:flutter/material.dart';
import 'package:testtask/screens/GameWrapper/index.dart';
import 'package:testtask/services/asyncStorage.dart';
import 'package:testtask/components/playerCont.dart';
import 'dart:async';
import 'package:testtask/components/voteButton.dart';
import 'package:testtask/services/navigation.dart';

class VoteScreen extends StatefulWidget {
  @override
  createState() => new VoteScreenState();
}

class VoteScreenState extends State<VoteScreen> {
  List players;
  var leader;
  int like = 0;
  int dislike = 0;
  Timer _timer;
  int _start = 5;

  @override
  void initState() {
    super.initState();
    getData();
    startTimer();
  }

  @override
  void deactivate() {
    super.deactivate();
    _timer.cancel();
    // remover();
  }

  void startTimer() {
    _timer = new Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            navigationReset(
                context,
                GameWrapper(screen: 'VoteResult',
                  voteRes: like > dislike,
                  like: like,
                  dislike: dislike,
                ));
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  remover() async {
    await removeFromAsyncStorage('lead');
    await removeFromAsyncStorage('checkedUsers');
  }

  getData() async {
    var dataLead = await getFromAsyncStorage('string', 'lead', true);
    var dataPlayer = await getFromAsyncStorage('string', 'checkedUsers', true);
    setState(() {
      players = dataPlayer;
      leader = dataLead;
    });
  }

  countVote(n) {
    setState(() {
      n ? ++like : ++dislike;
    });
  }

  @override
  Widget build(BuildContext context) {
    return leader != null && players != null
        ? SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Round 3: Automobile',
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'PaybAck',
                          color: Color(0xFFce1140)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
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
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'LEADER',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Image(
                            image: AssetImage(leader["avatar"]),
                            width: 45,
                            height: 45,
                          ),
                        ),
                        Text(
                          leader["name"],
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'OPERATORS',
                      style: TextStyle(
                        fontFamily: 'PaybAck',
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Wrap(
                      children: players
                          .map<Widget>((item) => PlayersContainer(
                                avatar: item["avatar"],
                                name: item["name"],
                              ))
                          .toList()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      VoteBtn(
                        icon: Icons.thumb_up,
                        colorBtn: Color(0xFF008a63),
                        colorShadow: Color(0xFF004e38),
                        onPressed: () {
                          countVote(true);
                        },
                        counter: like,
                      ),
                      VoteBtn(
                        icon: Icons.thumb_down,
                        colorBtn: Color(0xFFce1141),
                        colorShadow: Color(0xFF71041f),
                        onPressed: () {
                          countVote(false);
                        },
                        counter: dislike,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        : Container(
            alignment: Alignment.center,
            child: new CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Color(0xFFf44336)),
            ),
          );
  }
}
