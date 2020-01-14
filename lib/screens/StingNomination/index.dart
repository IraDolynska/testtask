import 'package:flutter/material.dart';
import 'dart:math';
import 'package:testtask/screens/VoitingScreen/index.dart';
import 'package:testtask/components/playerButton.dart';
import 'package:testtask/services/asyncStorage.dart';
import 'dart:convert';
import 'package:testtask/constants/imgList.dart';
import 'package:testtask/constants/usersList.dart';

class NomScreen extends StatefulWidget {
  @override
  createState() => new NomScreenState();
}

class NomScreenState extends State<NomScreen> {
  int number;
  Random rand = Random();
  var lead;
  List checkedUsers = [];

  @override
  void initState() {
    super.initState();
    this.number = randNum(5);
    setState(() {
      lead = users[rand.nextInt(10)];
    });
  }

  int randNum(n) {
    return rand.nextInt(n) + 1;
  }

  void pressCheck(id) {
    setState(() {
      var user = users.firstWhere((user) => user["id"] == id);
      if (checkedUsers.contains(user)) {
        checkedUsers.remove(user);
      } else
        checkedUsers.add(user);
    });
  }

  saveDate() async {
    await addToAsyncStorage('string', 'checkedUsers', jsonEncode(checkedUsers));
    await addToAsyncStorage('string', 'lead', jsonEncode(lead));
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => VoteScreen()),
        (Route<dynamic> route) => false);
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
                      'Round 2: Automobile',
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
                  Container(
                    margin: EdgeInsets.all(5.0),
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
                        Container(
                          margin: EdgeInsets.all(10.0),
                          child: Image(
                            image: AssetImage(lead["avatar"]),
                            width: 45,
                            height: 45,
                          ),
                        ),
                        Text(
                          lead["name"],
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                        style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontFamily: 'PaybAck'),
                        children: [
                          TextSpan(text: 'NOMINATE'),
                          TextSpan(
                            text: ' $number ',
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Color(0xFFce1140),
                            ),
                          ),
                          TextSpan(text: 'PLAYERS'),
                        ]),
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: users
                          .map<Widget>((item) => PlayerBtn(
                              onPressed: () {
                                pressCheck(item["id"]);
                              },
                              check: checkedUsers.contains(item),
                              avatar: item["avatar"],
                              name: item["name"]))
                          .toList()),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    width: 274,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                        color: Color(0xFF7b0725),
                        width: 5.0,
                      )),
                    ),
                    child: RaisedButton(
                      onPressed:
                          checkedUsers.length == number ? saveDate : null,
                      color: Color(0xFFce1140),
                      disabledColor: Colors.red[300],
                      child: Text('Nominate',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 21.0,
                            fontFamily: 'TypeWriter',
                          )),
                    ),
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
