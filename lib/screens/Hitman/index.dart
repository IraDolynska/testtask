import 'dart:async';
import 'package:flutter/material.dart';
import 'package:testtask/constants/imgList.dart';
import 'package:testtask/screens/MainScreen/index.dart';

class Hitman extends StatefulWidget {
  final bool role;
  final accused;
  Hitman({this.role, this.accused});
  @override
  createState() => new HitmanState();
}

class HitmanState extends State<Hitman> {
  Timer _timer;
  int _start = 5;
  bool profiler;
  bool informant;
  bool timerOut = true;

  @override
  void initState() {
    super.initState();
    setState(() {
      startTimer();
      profiler = widget.accused["profiler"];
      informant = widget.accused["informant"];
    });
  }
  // @override
  // void deactivate() {
  //   super.deactivate();
  //   _timer.cancel();
  // }

  void startTimer() {
    _timer = new Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            setState(() {
              _timer.cancel();
              timerOut = false;
            });
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/StingNominationScreen.jpg'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: images
                        .map<Widget>((item) => Image(
                            image: AssetImage(item), width: 45, height: 45))
                        .toList()),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 10.0),
                child: Text(
                  'hitman',
                  style: TextStyle(
                      fontSize: 40.0,
                      fontFamily: 'PaybAck',
                      color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Text(
                  'Congratulations fbi for completing 4 sting operations!',
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'PaybAck',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: Text(
                  widget.role ? 'profiler' : 'informant',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontFamily: 'PaybAck',
                      color: Colors.white),
                ),
              ),
              Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    child: Image(
                      image: AssetImage(widget.accused["avatar"]),
                      width: 143,
                      height: 143,
                    ),
                  ),
                  !timerOut
                      ? Positioned(
                          child: widget.role
                              ? Text(
                                  profiler
                                      ? 'Murdered!'
                                      : 'Alive!',
                                  style: TextStyle(
                                      fontFamily: 'PaybAck',
                                      fontSize: 32,
                                      color: profiler
                                          ? Color(0xFFce1141)
                                          : Colors.white),
                                )
                              : Text(
                                  informant
                                      ? 'Murdered!'
                                      : 'Alive!',
                                  style: TextStyle(
                                      fontFamily: 'PaybAck',
                                      fontSize: 32,
                                      color: informant
                                          ? Color(0xFFce1141)
                                          : Colors.white),
                                ),
                        )
                      : Container(),
                ],
              ),

              Container(
                child: Text(
                  widget.accused["name"],
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),

              timerOut
                  ? Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: Text(
                        '$_start',
                        style: TextStyle(
                            fontSize: 80,
                            color: Colors.white,
                            fontFamily: 'PaybAck'),
                      ),
                    )
                  : Container(
                margin: EdgeInsets.all(20.0),
                width: 274,
                height: 60,
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                    color: Color(0xFF7b0725),
                    width: 5.0,
                  )),
                ),
                child: FlatButton.icon(
                  onPressed: (){Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => MainScreen()),
                        (Route<dynamic> route) => false);},
                  color: Color(0xFFce1140),
                  label: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21.0,
                      fontFamily: 'TypeWriter',
                    ),
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.white,
                    size: 28.0,
                  ),
                ),
              ),

              
            ],
          ),
        ),
      ],
    ));
  }
}
