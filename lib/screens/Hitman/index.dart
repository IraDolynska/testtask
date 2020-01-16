import 'dart:async';
import 'package:flutter/material.dart';
import 'package:testtask/components/button.dart';
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
  bool timerOut = false;
  bool murdered = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      startTimer();
      if ((widget.accused["profiler"] == true && widget.role == true) ||
          (widget.accused["informant"] == true && widget.role == false)) {
        murdered = true;
      }
      print('murdered: $murdered');
    });
  }

  void startTimer() {
    _timer = new Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            setState(() {
              _timer.cancel();
              timerOut = true;
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
                margin: EdgeInsets.all(10.0),
                child: Text(
                  'Congratulations fbi for\ncompleting 4 sting\noperations!',
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
                    color: Colors.white,
                    decoration: !timerOut
                        ? TextDecoration.none
                        : murdered
                            ? TextDecoration.none
                            : TextDecoration.lineThrough,
                    decorationColor: Color(0xFFce1141),
                    decorationThickness: 3.0,
                  ),
                ),
              ),
              Stack(
                overflow: Overflow.visible,
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(500),
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                              !timerOut
                                  ? Colors.black.withOpacity(0)
                                  : murdered
                                      ? Colors.grey
                                      : Colors.black.withOpacity(0),
                              BlendMode.color),
                          child: Image(
                            image: AssetImage(widget.accused["avatar"]),
                            fit: BoxFit.contain,
                            // image: AssetImage('assets/images/testUser.png'),
                            width: 143,
                            height: 143,
                            alignment: Alignment.center,
                          ),
                        )),
                  ),
                  timerOut
                      ? Positioned(
                          top: murdered ? 50 : 5,
                          left: murdered ? null : 10,
                          child: murdered
                              ? RotationTransition(
                                  turns: AlwaysStoppedAnimation(345 / 360),
                                  child: Text('Murdered!',
                                      style: TextStyle(
                                          fontFamily: 'PaybAck',
                                          fontSize: 32,
                                          color: Color(0xFFce1141))),
                                )
                              : RotationTransition(
                                  turns: AlwaysStoppedAnimation(340 / 360),
                                  child: Text('Alive!',
                                      style: TextStyle(
                                        fontFamily: 'PaybAck',
                                        fontSize: 32,
                                        color: Colors.white,
                                        shadows: [
                                          Shadow(
                                            blurRadius: 1.0,
                                            color: Color(0xFF1f5c9a),
                                            offset: Offset(1.5, 1.5),
                                          ),
                                          Shadow(
                                            blurRadius: 1.0,
                                            color: Color(0xFF1f5c9a),
                                            offset: Offset(-1.5, -1.5),
                                          ),
                                        ],
                                      )),
                                ),
                        )
                      : Positioned(
                          child: Container(),
                        ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  widget.accused["name"],
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              !timerOut
                  ? Container(
                      child: Text(
                        '$_start',
                        style: TextStyle(
                            fontSize: 80,
                            color: Colors.white,
                            fontFamily: 'PaybAck'),
                      ),
                    )
                  : Btn(
                    onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainScreen()),
                              (Route<dynamic> route) => false);
                        },
                        icon: Icons.arrow_forward_ios,
                        text: 'Next',
                        iconFirst: false,
                  ),
            ],
          ),
        ),
      ],
    ));
  }
}
