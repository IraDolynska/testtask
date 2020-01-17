import 'package:flutter/material.dart';
import 'package:testtask/screens/GameWrapper/index.dart';
import 'package:testtask/services/navigation.dart';

class PlaceVote extends StatefulWidget {
  @override
  _PlaceVoteState createState() => _PlaceVoteState();
}

class _PlaceVoteState extends State<PlaceVote> {
  buttonRound(imagePath, success, colorBtn, colorShadow) {
    return Container(
      margin: EdgeInsets.only(top: 70.0),
      height: 160,
      width: 160,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: colorShadow,
            spreadRadius: 2.5,
            offset: Offset(0, 2.5),
          ),
        ],
      ),
      child: FlatButton(
        onPressed: () {
          navigationReset(
              context,
              GameWrapper(
                screen: 'StingOperResult',
                operRes: success,
              ));
        },
        child: Image(
          width: 127.5,
          height: 81.5,
          image: AssetImage(imagePath),
        ),
        shape: CircleBorder(),
        color: colorBtn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(25.0),
            child: Text(
              'Place your\nvote!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 36, fontFamily: 'PaybAck', color: Colors.white),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buttonRound('assets/images/coop.png', true, Color(0xFF1f5c9a),
                  Color(0xFF002c57)),
              buttonRound('assets/images/sabot.png', false, Color(0xFFce1141),
                  Color(0xFF71041f)),
            ],
          ),
        ],
      ),
    );
  }
}
