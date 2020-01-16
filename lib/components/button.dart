import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  Btn({this.text, @required this.onPressed, this.icon, this.iconFirst});
  final text;
  final Function onPressed;
  final icon;
  final bool iconFirst;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: icon != null
          ? FlatButton.icon(
              onPressed: onPressed,
              color: Color(0xFFce1140),
              disabledColor: Colors.red[300],
              icon: iconFirst
                  ? Icon(
                      icon,
                      color: Colors.white,
                      size: 21.0,
                    )
                  : Text(
                      text,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21.0,
                        fontFamily: 'TypeWriter',
                      ),
                    ),
              label: iconFirst
                  ? Text(
                      text,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21.0,
                        fontFamily: 'TypeWriter',
                      ),
                    )
                  : Icon(
                      icon,
                      color: Colors.white,
                      size: 21.0,
                    ),
            )
          : FlatButton(
              onPressed: onPressed,
              color: Color(0xFFce1140),
              disabledColor: Colors.red[300],
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21.0,
                  fontFamily: 'TypeWriter',
                ),
              ),
            ),
    );
  }
}
