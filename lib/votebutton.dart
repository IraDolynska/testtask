import 'package:flutter/material.dart';

class SmallRaisedBtn extends StatelessWidget {
  SmallRaisedBtn({this.check, @required this.onPressed});
  final check;
  final Function onPressed;
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
        label: Text(
          'user5',
          style: TextStyle(
            color: Colors.white,
            fontSize: 21.0,
          ),
        ),
        onPressed: onPressed,
      ),

      
    );
  }
}

// class Votebutton extends StatefulWidget {
//   @override
//   createState() => new VotebuttonState();
// }
// class VotebuttonState extends State<Votebutton> {

// class button(check, pressCheck){
//    FlatButton.icon(
//        Icon: widget.check ? Icons.check_box : Icons.check_box_outline_blank;
//        OnPress: widget.pressCheck;
//    )
// }

// class list(){

//    List users = [
//      {
//          "id": 1,
//          "avatar": "assets/1.png",
//          "name": "Alan"
//      },
//      {
//          "id": 2,
//          "avatar": "assets/2.png",
//          "name": "Richard"
//      },
//      {
//          "id": 3,
//          "avatar": "assets/3.png",
//          "name": "Bob"
//      },
//      {
//          "id": 4,
//          "avatar": "assets/4.png",
//          "name": "Adam"
//      },
//      {
//          "id": 5,
//          "avatar": "assets/5.png",
//          "name": "Andrew"
//      },
//    ];

//    checkedUsers = [];

//    press(userId){
//        setState(){
//           checkedUsers: checkedUsers.push(userId)
//        }
//    };
// };

// }
