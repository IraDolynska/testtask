import 'package:flutter/material.dart';
import 'dart:math';
import 'package:testtask/voitingscreen.dart';
import 'package:testtask/votebutton.dart';
import 'package:testtask/services/asyncStorage.dart';
import 'dart:convert';

class NomScreen extends StatefulWidget {
  @override
  createState() => new NomScreenState();
}

class NomScreenState extends State<NomScreen> {
  // This widget is the root of your application.
  int number;
  Random rand = Random();
  var lead;

  int RandNum(n) {
    return rand.nextInt(n) + 1;
  }

  void initState() {
    super.initState();
    
    setState(() {
      lead = users[rand.nextInt(10)];
    });
  }


  NomScreenState() {
    this.number = RandNum(5);
  }
  List<String> images = [
    'assets/0.png',
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
    'assets/5.png',
    'assets/6.png'
  ];
  List users = [
    {"id": 1, "avatar": "assets/us1.png", "name": "Alan"},
    {"id": 2, "avatar": "assets/us2.png", "name": "Richard"},
    {"id": 3, "avatar": "assets/us3.png", "name": "Bob"},
    {"id": 4, "avatar": "assets/us4.png", "name": "Adam"},
    {"id": 5, "avatar": "assets/us5.png", "name": "Andrew"},
    {"id": 6, "avatar": "assets/us6.png", "name": "Kate"},
    {"id": 7, "avatar": "assets/us7.png", "name": "Loren"},
    {"id": 8, "avatar": "assets/us8.png", "name": "Helen"},
    {"id": 9, "avatar": "assets/us9.png", "name": "Sally"},
    {"id": 10, "avatar": "assets/us7.png", "name": "Ira"},
  ];

  List checkedUsers = [];

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

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => VoteScreen()),
    );
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      'Round 2: Automobile',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'PaybAck',
                        color: Color(0xFFce1140)
                      ),
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
                      children: [
                        Text(
                          'LEADER   ',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: EdgeInsets.all(7.0),
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
                          .map((item) => SmallRaisedBtn(
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
                      onPressed: checkedUsers.length == number
                          ? () {
                              saveDate();
                            }
                          : null,
                      color: Color(0xFFce1140),
                      disabledColor: Colors.red[300],
                      child: Text('Nominate',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 21.0,
                            //fontFamily: 'TypeWriter',
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
