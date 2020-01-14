import 'package:flutter/material.dart';

class PlayersContnr extends StatelessWidget {
  PlayersContnr({this.avatar, this.name});
  final avatar;
  final name;

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.all(3.0),
        width: 163.5,
        height: 51.5,
        decoration: BoxDecoration(
            color: Color(0xFF2a2a2a), borderRadius: BorderRadius.circular(30)),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(5.0),
              child: Image(
                image: AssetImage(avatar),
                width: 45,
                height: 45,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ));
  }
}
