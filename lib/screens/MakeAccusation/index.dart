import 'package:flutter/material.dart';
import 'package:testtask/components/button.dart';
import 'package:testtask/components/playerButton.dart';
import 'package:testtask/constants/usersList.dart';
import 'package:testtask/screens/GameWrapper/index.dart';
import 'package:testtask/services/navigation.dart';

class MakeAccusation extends StatefulWidget {
  @override
  createState() => new MakeAccusationState();
}

class MakeAccusationState extends State<MakeAccusation> {
  var accused;
  bool prof_inf = false; //true - Profiler; false - Informant

  pressProfilerOrInformant() {
    setState(() {
      prof_inf = !prof_inf;
    });
  }

  void pressCheck(id) {
    var user = users.firstWhere((user) => user["id"] == id);
    setState(() {
      accused == user ? accused = null : accused = user;
    });
  }

  roleButton(text, onPressed) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: 158,
      height: 60.5,
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
          color: Color(0xFFce1140),
          width: 5.0,
        )),
      ),
      child: FlatButton(
        onPressed: onPressed,
        color: Color(0xFF2a2a2a),
        disabledColor: Color(0xFFce1140),
        child: Text(text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 21.0,
              fontFamily: 'PaybAck',
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Make an accusation',
                style: TextStyle(
                    fontSize: 36, fontFamily: 'PaybAck', color: Colors.white),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                  'Guess the Informant or Profiler\nbelow to win the game',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                  textAlign: TextAlign.center),
            ),
            Row(
              children: <Widget>[
                roleButton(
                    'Prifiler', prof_inf ? null : pressProfilerOrInformant),
                roleButton(
                    'Informant', prof_inf ? pressProfilerOrInformant : null),
              ],
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: users
                    .map<Widget>((item) => PlayerBtn(
                        beforeIcon: Icons.lens,
                        afterIcon: Icons.album,
                        onPressed: () {
                          pressCheck(item["id"]);
                        },
                        check: accused == item,
                        avatar: item["avatar"],
                        name: item["name"]))
                    .toList()),
            Btn(
              onPressed: accused != null
                  ? () {
                      navigationReset(
                          context,
                          GameWrapper(
                            screen: 'Hitman',
                            role: prof_inf,
                            accused: accused,
                          ));
                    }
                  : null,
              text: 'Guess',
              iconFirst: false,
            ),
          ],
        ),
      ),
    );
  }
}
