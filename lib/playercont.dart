import 'package:flutter/material.dart';

class PlayersContnr extends StatelessWidget {
  PlayersContnr({ this.avatar, this.name});
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
          color: Color(0xFF2a2a2a),
          width: 3.0,
        )),
      ),
      child: Row(children: <Widget>[
        Container( margin: EdgeInsets.all(5.0),
            child:Image(image: AssetImage(avatar),
             width: 45,height: 45,),),
        Container( margin: EdgeInsets.all(5.0),
          child: Text(name, 
          style: TextStyle(
            color: Colors.white,
            fontSize: 21.0,
          ),),),
      ],)
    );
  }
}