import 'dart:async';
import 'package:flutter/material.dart';
import 'package:testtask/constants/imgList.dart';
import 'package:testtask/screens/PlaceYourVote/index.dart';
import 'package:testtask/screens/StingNomination/index.dart';
import 'package:testtask/components/voteButton.dart';

class VoteResult extends StatefulWidget {
  final voteRes;
  final int like;
  final int dislike;

  VoteResult({this.voteRes, this.like, this.dislike});
  @override
  createState() => new VoteResultState();
}

class VoteResultState extends State<VoteResult> {
  Timer _timer;
  int _start = 5;

  @override
  void initState() {
    super.initState();
    setState(() {
      startTimer();
    });
  }
  @override
  void deactivate() {
    super.deactivate();
    _timer.cancel();
  }

  void startTimer() {
    _timer = new Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            setState(() {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          widget.voteRes ? PlaceVote() : NomScreen()),
                  (Route<dynamic> route) => false);
            });
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/StingNominationScreen.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 5.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: images
                        .map<Widget>((item) => Image(
                            image: AssetImage(item), width: 45, height: 45))
                        .toList()),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 30, 0, 30),
                child: Image(
                  image: widget.voteRes
                      ? AssetImage('assets/images/succs.png')
                      : AssetImage('assets/images/fail.png'),
                  width: 285.5,
                  height: 86,
                ),
              ),
              Column(
                children: <Widget>[
                  Text(
                    widget.voteRes
                        ? "Sting begins in..."
                        : "Next nomination in...",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      VoteBtn(
                        icon: Icons.thumb_up,
                        colorBtn: Color(0xFF008a63),
                        colorShad: Color(0xFF004e38),
                        onPressed: null,
                        counter: widget.like,
                      ),
                      VoteBtn(
                        icon: Icons.thumb_down,
                        colorBtn: Color(0xFFce1141),
                        colorShad: Color(0xFF71041f),
                        onPressed: null,
                        counter: widget.dislike,
                      ),
                    ],
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
