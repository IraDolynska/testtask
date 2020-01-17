import 'package:flutter/material.dart';
import 'package:testtask/components/button.dart';
import 'package:testtask/components/playerCont.dart';
import 'package:testtask/screens/GameWrapper/index.dart';
import 'package:testtask/screens/MainScreen/index.dart';
import 'package:testtask/services/asyncStorage.dart';
import 'package:testtask/services/navigation.dart';

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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 65.0),
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: (Colors.blue.withOpacity(widget.voteRes ? 0.5 : 0)),
              image: DecorationImage(
                image: AssetImage(
                    widget.voteRes ? 'assets/images/conffettie.png' : ''),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    widget.voteRes ? 'Success!' : 'Sabotage!',
                    style: TextStyle(
                        fontSize: 40.0,
                        fontFamily: 'PaybAck',
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
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
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Image(
                          image: AssetImage('assets/images/2.png'),
                          fit: BoxFit.contain,
                          width: 130.5,
                          height: 130.5),
                      Positioned(
                        left: 85,
                        bottom: 85,
                        child: Image(
                          image: AssetImage(widget.voteRes
                              ? 'assets/images/check.png'
                              : 'assets/images/cross.png'),
                          width: 55.0,
                          height: 55.0,
                        ),
                      ),
                    ],
                  ),
                ),
                players != null
                    ? Padding(
                        padding: EdgeInsets.all(10),
                        child: Wrap(
                            children: players
                                .map<Widget>((item) => PlayersContainer(
                                      avatar: item["avatar"],
                                      name: item["name"],
                                    ))
                                .toList()),
                      )
                    : Container(
                        alignment: Alignment.center,
                        child: new CircularProgressIndicator(
                          valueColor: new AlwaysStoppedAnimation<Color>(
                              Color(0xFFf44336)),
                        ),
                      ),
                Btn(
                  onPressed: () {
                    widget.voteRes
                        ? navigationReset(
                            context, GameWrapper(screen: 'MakeAccusation'))
                        : navigationReset(context, MainScreen());
                  },
                  icon: Icons.arrow_forward_ios,
                  text: 'Next',
                  iconFirst: false,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
