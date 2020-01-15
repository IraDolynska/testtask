import 'package:flutter/material.dart';
import 'package:testtask/constants/imgList.dart';
import 'package:testtask/screens/StingOperation/index.dart';

class PlaceVote extends StatefulWidget {
  @override
  _PlaceVoteState createState() => _PlaceVoteState();
}

class _PlaceVoteState extends State<PlaceVote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            .map<Widget>((item) => Image(
                                image: AssetImage(item), width: 45, height: 45))
                            .toList()),
                  ),
                  Container(
                    margin: EdgeInsets.all(25.0),
                    child: Text(
                      'Place your\n  vote!',
                      style: TextStyle(
                          fontSize: 36,
                          fontFamily: 'PaybAck',
                          color: Colors.white),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 70.0),
                        height: 160,
                        width: 160,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF002c57),
                              spreadRadius: 2.5,
                               offset: Offset(0, 2.5),
                            ),
                          ],
                        ),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StingOperResult(
                          voteRes: true,
                        )) );
                          },
                          child: Image(
                            width: 127.5,
                            height: 81.5,
                            image: AssetImage('assets/images/coop.png'),
                          ),
                          shape: CircleBorder(),
                          color: Color(0xFF1f5c9a),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 70.0),
                        height: 160,
                        width: 160,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF71041f),
                              spreadRadius: 2.5,
                              offset: Offset(0, 2.5),
                            ),
                          ],
                        ),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StingOperResult(
                          voteRes: false,
                        )) );
                          },
                          child: Image(
                            width: 114.5,
                            height: 85.5,
                            image: AssetImage('assets/images/sabot.png'),
                          ),
                          shape: CircleBorder(),
                          color: Color(0xFFce1141),
                        ),
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
