import 'package:flutter/material.dart';
import 'package:testtask/components/button.dart';
import 'package:testtask/screens/GameWrapper/index.dart';
import 'dart:math';
import 'package:testtask/components/playerButton.dart';
import 'package:testtask/services/asyncStorage.dart';
import 'dart:convert';
import 'package:testtask/constants/usersList.dart';
import 'package:testtask/services/navigation.dart';

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
    number = randNum(5);
    choiceLeader();
  }

  choiceLeader() {
    setState(() {
      lead = users[rand.nextInt(10)];
    });
  }

  int randNum(n) {
    return rand.nextInt(n) + 1;
  }

  void pressCheck(id) {
    var user = users.firstWhere((user) => user["id"] == id);
    setState(() {
      if (checkedUsers.contains(user)) {
        checkedUsers.remove(user);
      } else
        checkedUsers.add(user);
    });
  }

  saveDate() async {
    await addToAsyncStorage('string', 'checkedUsers', jsonEncode(checkedUsers));
    await addToAsyncStorage('string', 'lead', jsonEncode(lead));
    navigationReset(context, GameWrapper(screen: 'VoteScreen'));
  }

  @override
  Widget build(BuildContext context) {
    return 
        
        SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Round 2: Automobile',
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
                          beforeIcon: Icons.check_box_outline_blank,
                          afterIcon: Icons.check_box,
                            onPressed: () {
                              pressCheck(item["id"]);
                            },
                            check: checkedUsers.contains(item),
                            avatar: item["avatar"],
                            name: item["name"]))
                        .toList()),
                Btn(
                  onPressed: checkedUsers.length == number ? saveDate : null,
                  icon: null,
                  text: 'Nominate',
                  iconFirst: false,
                ),
              ],
            ),
          ),
      
    );
  }
}
