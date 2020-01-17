import 'dart:async';
import 'package:flutter/material.dart';
import 'package:testtask/components/button.dart';
import 'package:testtask/screens/MainScreen/index.dart';
import 'package:testtask/services/navigation.dart';

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
    startTimer();
    setState(() {
      if ((widget.accused["profiler"] == true && widget.role == true) ||
          (widget.accused["informant"] == true && widget.role == false)) {
        murdered = true;
      }
    });
  }

  void startTimer() {
    _timer = new Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            _timer.cancel();
            timerOut = true;
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
      child: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 10.0),
              child: Text(
                'hitman',
                style: TextStyle(
                    fontSize: 40.0, fontFamily: 'PaybAck', color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
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
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                widget.role ? 'profiler' : 'informant',
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'PaybAck',
                  color: Colors.white,
                  decoration: !timerOut || murdered
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
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(500),
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                            !timerOut || !murdered
                                ? Colors.black.withOpacity(0)
                                : Colors.grey,
                            BlendMode.color),
                        child: Image(
                          image: AssetImage(widget.accused["avatar"]),
                          fit: BoxFit.contain,
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
                    : Container(),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                widget.accused["name"],
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            !timerOut
                ? Text(
                    '$_start',
                    style: TextStyle(
                        fontSize: 80,
                        color: Colors.white,
                        fontFamily: 'PaybAck'),
                  )
                : Btn(
                    onPressed: () {
                      navigationReset(context, MainScreen());
                    },
                    icon: Icons.arrow_forward_ios,
                    text: 'Next',
                    iconFirst: false,
                  ),
          ],
        ),
      ),
    );
  }
}
