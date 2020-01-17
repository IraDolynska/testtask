import 'package:flutter/material.dart';

class PlayerBtn extends StatelessWidget {
  PlayerBtn(
      {this.check,
      @required this.onPressed,
      this.avatar,
      this.name,
      this.afterIcon,
      this.beforeIcon});
  final check;
  final Function onPressed;
  final avatar;
  final name;
  final beforeIcon;
  final afterIcon;

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(3.0),
      width: 274,
      height: 60,
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
          color: Color(0xFF004990),
          width: 3.0,
        )),
      ),
      child: new FlatButton(
        color: Color(check ? 0xFF004990 : 0xFF2a2a2a),
        onPressed: onPressed,
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Icon(
                check ? afterIcon : beforeIcon,
                color: Color(check ? 0xFFffffff : 0xFF525252),
                size: 28.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Image(
                image: AssetImage(avatar),
                width: 45,
                height: 45,
              ),
            ),
            Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
