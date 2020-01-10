import 'package:flutter/material.dart';

class VoteScreen extends StatefulWidget {
  @override
  createState() => new VoteScreenState();
}

class VoteScreenState extends State<VoteScreen> {
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
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: Image(
                        image: AssetImage('assets/0.png'),
                        width: 20,
                        height: 20,
                      ),
                    ),
                    Image(
                      image: AssetImage('assets/1.png'),
                      width: 45,
                      height: 45,
                    ),
                    Image(
                      image: AssetImage('assets/2.png'),
                      width: 45,
                      height: 45,
                    ),
                    Image(
                      image: AssetImage('assets/3.png'),
                      width: 45,
                      height: 45,
                    ),
                    Image(
                      image: AssetImage('assets/4.png'),
                      width: 45,
                      height: 45,
                    ),
                    Image(
                      image: AssetImage('assets/5.png'),
                      width: 45,
                      height: 45,
                    ),
                    Image(
                      image: AssetImage('assets/6.png'),
                      width: 45,
                      height: 45,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: Image(
                  image: AssetImage('assets/Round1.png'),
                  width: 262,
                  height: 18,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: Image(
                  image: AssetImage('assets/sting.png'),
                  width: 304,
                  height: 24,
                ),
              ),
              Text(
                'LEADER',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),

              // RichText(
              //   text: TextSpan(style: TextStyle(fontSize: 26.0, color: Colors.white, fontWeight: FontWeight.bold),
              //     children: [
              //       TextSpan(text:'NOMINATE '),
              //       TextSpan(text:' $number ', style: TextStyle(fontSize: 30.0, color: Color(0xFFce1140),),),
              //       TextSpan(text:' PLAYERS'),
              //     ]),
              // ),
            ],
          ),
        ),
      ],
    ));
  }
}
