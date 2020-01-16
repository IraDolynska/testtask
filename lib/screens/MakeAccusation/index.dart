import 'package:flutter/material.dart';
import 'package:testtask/components/button.dart';
import 'package:testtask/components/playerCheck.dart';
import 'package:testtask/constants/imgList.dart';
import 'package:testtask/constants/usersList.dart';
import 'package:testtask/screens/Hitman/index.dart';

class MakeAccusation extends StatefulWidget {
  @override
  createState() => new MakeAccusationState();
}

class MakeAccusationState extends State<MakeAccusation> {
  var accused;
  bool prof_inf = false; //true - Profiler; false - Informant

  pressProfiler() {
    setState(() {
      prof_inf = true;
      print(prof_inf);
    });
  }

  pressInformant() {
    setState(() {
      prof_inf = false;
      print(prof_inf);
    });
  }

  void pressCheck(id) {
    setState(() {
      var user = users.firstWhere((user) => user["id"] == id);
      if (accused == user) {
        accused = null;
      } else
        accused = user;
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
              image: AssetImage("assets/images/StingNominationScreen.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        ListView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    margin: EdgeInsets.all(10.0),
                    child: Text(
                      'Make an accusation',
                      style: TextStyle(
                          fontSize: 36,
                          fontFamily: 'PaybAck',
                          color: Colors.white),
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                        'Guess the Informant or Profiler\nbelow to win the game',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        textAlign: TextAlign.center),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
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
                          onPressed: prof_inf ? null : pressProfiler,
                          color: Color(0xFF2a2a2a),
                          disabledColor: Color(0xFFce1140),
                          child: Text('Profiler',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 21.0,
                                fontFamily: 'PaybAck',
                              )),
                        ),
                      ),
                      Container(
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
                          onPressed: prof_inf ? pressInformant : null,
                          color: Color(0xFF2a2a2a),
                          disabledColor: Color(0xFFce1140),
                          child: Text('Informant',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 21.0,
                                fontFamily: 'PaybAck',
                              )),
                        ),
                      ),
                    ],
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: users
                          .map<Widget>((item) => PlayerCheck(
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Hitman(
                                          role: prof_inf,
                                          accused: accused,
                                        )));
                          }
                        : null,
                    text: 'Guess',
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
