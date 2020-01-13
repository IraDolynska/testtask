import 'package:flutter/material.dart';

class SmallRaisedBtn extends StatelessWidget {
  SmallRaisedBtn({this.check, @required this.onPressed, this.avatar, this.name});
  final check;
  final Function onPressed;
  final avatar;
  final name;  

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
      child: new RaisedButton.icon(
        color: check ? Color(0xFF004990) : Color(0xFF2a2a2a),
        icon: Icon(
          check ? Icons.check_box : Icons.check_box_outline_blank,
          color: check ? Colors.white : Color(0xFF525252),
          size: 28.0,
        ),
        label: Row(
          children:[
          Container( margin: EdgeInsets.all(5.0),
            child:Image(image: AssetImage(avatar), width: 45,height: 45,),),
          Container( margin: EdgeInsets.all(5.0),
          child: Text(name, 
          style: TextStyle(
            color: Colors.white,
            fontSize: 21.0,
          ),
        ),),
        ],),

     onPressed: onPressed, 
    ),
    );
  }
}





