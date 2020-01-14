import 'package:flutter/material.dart';

class VoteBtn extends StatefulWidget {
  final icon;
  final colorBtn;
  final colorShad;
  final int counter;
  final Function onPressed;

  VoteBtn(
      {this.icon,
      this.colorBtn,
      this.colorShad,
      this.counter,
      @required this.onPressed});
  @override
  createState() => new VoteBtnState();
}

class VoteBtnState extends State<VoteBtn> {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(20.0),
          height: 117,
          width: 117,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: widget.colorShad,
                spreadRadius: 2,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: RaisedButton(
            onPressed: widget.onPressed,
            child: Icon(
              widget.icon,
              color: Colors.white,
              size: 50,
            ),
            shape: CircleBorder(),
            color: widget.colorBtn,
            disabledColor: widget.colorShad,
          ),
        ),
        Positioned(
          right: 15,
          top: 15,
          child: Container(
            width: 43,
            height: 43,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF505050),
            ),
            child: Center(
              child: Text(
                '${widget.counter}',
                style: TextStyle(
                    fontSize: 24, color: Colors.white, fontFamily: 'PaybAck'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
