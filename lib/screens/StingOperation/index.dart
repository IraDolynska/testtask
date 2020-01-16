import 'package:flutter/material.dart';
import 'package:testtask/components/button.dart';
import 'package:testtask/components/playerCont.dart';
import 'package:testtask/constants/imgList.dart';
import 'package:testtask/screens/MainScreen/index.dart';
import 'package:testtask/screens/MakeAccusation/index.dart';
import 'package:testtask/services/asyncStorage.dart';

class StingOperResult extends StatefulWidget {
  final voteRes;
  StingOperResult({this.voteRes});
  @override
  createState() => new StingOperResultState();
}

class StingOperResultState extends State<StingOperResult> {
  List players;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var dataPlayer = await getFromAsyncStorage('string', 'checkedUsers', true);
    setState(() {
      players = dataPlayer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: widget.voteRes
                  ? AssetImage('assets/images/sabotageBckgrnd.png')
                  : AssetImage('assets/images/StingNominationScreen.jpg'),
              fit: BoxFit.fill,
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: images
                        .map<Widget>((item) => Image(
                            image: AssetImage(item), width: 45, height: 45))
                        .toList()),
              ),
              Container(
                child: Text(
                  widget.voteRes ? 'Success!' : 'Sabotage!',
                  style: TextStyle(
                      fontSize: 40.0,
                      fontFamily: 'PaybAck',
                      color: Colors.white),
                ),
              ),
              Container(
                child: Text(
                  widget.voteRes
                      ? 'The sting operation\nwas carried out\nsuccessfully!'
                      : 'The sting operation\nwas sabotaged!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'PaybAck',
                  ),
                ),
              ),
              Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                      child: Image(
                          image: AssetImage('assets/images/icon.png'),
                          width: 130.5,
                          height: 130.5)),
                  Positioned(
                    left: 85,
                    bottom: 85,
                    child: Image(
                      image: widget.voteRes
                          ? AssetImage('assets/images/check.png')
                          : AssetImage('assets/images/cross.png'),
                      width: 55.0,
                      height: 55.0,
                    ),
                  ),
                ],
              ),
              players != null
                  ? Wrap(
                      children: players
                          .map<Widget>((item) => PlayersContnr(
                                avatar: item["avatar"],
                                name: item["name"],
                              ))
                          .toList())
                  : Container(
                      alignment: Alignment.center,
                      child: new CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(
                            Color(0xFFf44336)),
                      ),
                    ),
              Btn(
                onPressed: widget.voteRes
                    ? () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MakeAccusation()),
                            (Route<dynamic> route) => false);
                      }
                    : () {
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
