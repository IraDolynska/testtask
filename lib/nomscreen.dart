import 'package:flutter/material.dart';
import 'dart:math';
import 'package:testtask/voitingscreen.dart';
import 'package:testtask/votebutton.dart';

class NomScreen extends StatefulWidget {
  @override
  createState() => new NomScreenState();
}

class NomScreenState extends State<NomScreen> {
  // This widget is the root of your application.
  int number;
  bool check = false;
  Random rand = Random();
  bool counter = false;
  int count = 0;

  int RandNum(n) {
    return number = rand.nextInt(n) + 1;
  }

  NomScreenState() {
    this.number = RandNum(5);
  }


  void pressCheck() {
    setState(() {
      this.check = !this.check;
      if(check) this.count++;
      else this.count--;

      if(this.count==this.number) this.counter=true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.black,
        // ),
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
                  image: AssetImage('assets/Round.png'),
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
              RichText(
                text: TextSpan(
                    style: TextStyle(
                        fontSize: 26.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(text: 'NOMINATE '),
                      TextSpan(
                        text: ' $number ',
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Color(0xFFce1140),
                        ),
                      ),
                      TextSpan(text: ' PLAYERS'),
                    ]),
              ),

              SmallRaisedBtn(onPressed: pressCheck, check: check,),
              SmallRaisedBtn(onPressed: pressCheck, check: check,),
              SmallRaisedBtn(onPressed: pressCheck, check: check,),
              SmallRaisedBtn(onPressed: pressCheck, check: check,),
              SmallRaisedBtn(onPressed: pressCheck, check: check,),


               
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: <Widget>[
              //     Container(
              //       margin: EdgeInsets.all(3.0),
              //       width: 274,
              //       height: 60,
              //       decoration: BoxDecoration(
              //         border: Border(
              //             bottom: BorderSide(
              //           color: Color(0xFF004990),
              //           width: 3.0,
              //         )),
              //       ),
              //       child: FlatButton.icon(
              //         onPressed: pressCheck,
              //         color: check ? Color(0xFF004990) : Color(0xFF2a2a2a),
              //         icon: Icon(
              //           check ? Icons.check_box : Icons.check_box_outline_blank,
              //           color: check ? Colors.white : Color(0xFF525252),
              //           size: 28.0,
              //         ),
              //         label: Text(
              //           'user1',
              //           style: TextStyle(
              //             color: Colors.white,
              //             fontSize: 21.0,
              //           ),
              //         ),
              //       ),
              //     ),
              //     Container(
              //       margin: EdgeInsets.all(3.0),
              //       width: 274,
              //       height: 60,
              //       decoration: BoxDecoration(
              //         border: Border(
              //             bottom: BorderSide(
              //           color: Color(0xFF004990),
              //           width: 3.0,
              //         )),
              //       ),
              //       child: FlatButton.icon(
              //         onPressed: pressCheck,
              //         color: check ? Color(0xFF004990) : Color(0xFF2a2a2a),
              //         icon: Icon(
              //           check ? Icons.check_box : Icons.check_box_outline_blank,
              //           color: check ? Colors.white : Color(0xFF525252),
              //           size: 28.0,
              //         ),
              //         label: Text(
              //           'user2',
              //           style: TextStyle(
              //             color: Colors.white,
              //             fontSize: 21.0,
              //           ),
              //         ),
              //       ),
              //     ),
              //     Container(
              //       margin: EdgeInsets.all(3.0),
              //       width: 274,
              //       height: 60,
              //       decoration: BoxDecoration(
              //         border: Border(
              //             bottom: BorderSide(
              //           color: Color(0xFF004990),
              //           width: 3.0,
              //         )),
              //       ),
              //       child: FlatButton.icon(
              //         onPressed: pressCheck,
              //         color: check ? Color(0xFF004990) : Color(0xFF2a2a2a),
              //         icon: Icon(
              //           check ? Icons.check_box : Icons.check_box_outline_blank,
              //           color: check ? Colors.white : Color(0xFF525252),
              //           size: 28.0,
              //         ),
              //         label: Text(
              //           'user3',
              //           style: TextStyle(
              //             color: Colors.white,
              //             fontSize: 21.0,
              //           ),
              //         ),
              //       ),
              //     ),
              //     Container(
              //       margin: EdgeInsets.all(3.0),
              //       width: 274,
              //       height: 60,
              //       decoration: BoxDecoration(
              //         border: Border(
              //             bottom: BorderSide(
              //           color: Color(0xFF004990),
              //           width: 3.0,
              //         )),
              //       ),
              //       child: FlatButton.icon(
              //         onPressed: pressCheck,
              //         color: check ? Color(0xFF004990) : Color(0xFF2a2a2a),
              //         icon: Icon(
              //           check ? Icons.check_box : Icons.check_box_outline_blank,
              //           color: check ? Colors.white : Color(0xFF525252),
              //           size: 28.0,
              //         ),
              //         label: Text(
              //           'user4',
              //           style: TextStyle(
              //             color: Colors.white,
              //             fontSize: 21.0,
              //           ),
              //         ),
              //       ),
              //     ),
              //     Container(
              //       margin: EdgeInsets.all(3.0),
              //       width: 274,
              //       height: 60,
              //       decoration: BoxDecoration(
              //         border: Border(
              //             bottom: BorderSide(
              //           color: Color(0xFF004990),
              //           width: 3.0,
              //         )),
              //       ),
              //       child: FlatButton.icon(
              //         onPressed: pressCheck,
              //         color: check ? Color(0xFF004990) : Color(0xFF2a2a2a),
              //         icon: Icon(
              //           check ? Icons.check_box : Icons.check_box_outline_blank,
              //           color: check ? Colors.white : Color(0xFF525252),
              //           size: 28.0,
              //         ),
              //         label: Text(
              //           'user5',
              //           style: TextStyle(
              //             color: Colors.white,
              //             fontSize: 21.0,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              Container(
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
                  onPressed: counter ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VoteScreen()),
                    ); 
                  } : null,
                  color: Color(0xFFce1140),
                  disabledColor: Colors.red[300],
                  child: Text('Nominate',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21.0,
                      )),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
