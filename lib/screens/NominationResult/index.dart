import 'dart:async';
import 'package:flutter/material.dart';
import 'package:testtask/screens/GameWrapper/index.dart';
import 'package:testtask/components/voteButton.dart';
import 'package:testtask/services/navigation.dart';

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
    startTimer();
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
            navigationReset(
                context,
                GameWrapper(
                    screen: widget.voteRes ? 'PlaceVote' : 'NomScreen'));
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
            child: Image(
              image: AssetImage(widget.voteRes
                  ? 'assets/images/succs.png'
                  : 'assets/images/fail.png'),
              width: 285.5,
              height: 86,
            ),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'PaybAck',
              ),
              children: [
                TextSpan(
                    text: widget.voteRes
                        ? 'Sting begins in...\n'
                        : 'Next nomination in...\n',
                    style: TextStyle(fontSize: 24)),
                TextSpan(text: '$_start', style: TextStyle(fontSize: 80)),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              VoteBtn(
                icon: Icons.thumb_up,
                colorBtn: Color(0xFF008a63),
                colorShadow: Color(0xFF004e38),
                onPressed: null,
                counter: widget.like,
              ),
              VoteBtn(
                icon: Icons.thumb_down,
                colorBtn: Color(0xFFce1141),
                colorShadow: Color(0xFF71041f),
                onPressed: null,
                counter: widget.dislike,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
