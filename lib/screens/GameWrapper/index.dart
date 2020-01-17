import 'package:flutter/material.dart';
import 'package:testtask/constants/imgList.dart';
import 'package:testtask/screens/Hitman/index.dart';
import 'package:testtask/screens/MakeAccusation/index.dart';
import 'package:testtask/screens/NominationResult/index.dart';
import 'package:testtask/screens/PlaceYourVote/index.dart';
import 'package:testtask/screens/StingNomination/index.dart';
import 'package:testtask/screens/StingOperation/index.dart';
import 'package:testtask/screens/VoitingScreen/index.dart';

class GameWrapper extends StatefulWidget {
  final screen;
  final voteRes;
  final operRes;
  final like;
  final dislike;
  final role;
  final accused;
  GameWrapper(
      {this.screen,
      this.voteRes,
      this.operRes,
      this.like,
      this.dislike,
      this.role,
      this.accused});
  @override
  createState() => new GameWrapperState();
}

class GameWrapperState extends State<GameWrapper> {
  switchFunc() {
    switch (widget.screen) {
      case 'NomScreen':
        return NomScreen();
        break;
      case 'VoteScreen':
        return VoteScreen();
        break;
      case 'VoteResult':
        return VoteResult(
          voteRes: widget.voteRes,
          like: widget.like,
          dislike: widget.dislike,
        );
        break;
      case 'PlaceVote':
        return PlaceVote();
        break;
      case 'StingOperResult':
        return StingOperResult(voteRes: widget.operRes);
        break;
      case 'MakeAccusation':
        return MakeAccusation();
        break;
      case 'Hitman':
        return Hitman(
          role: widget.role,
          accused: widget.accused,
        );
        break;
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage( 'assets/images/StingNominationScreen.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: images
                      .map<Widget>((item) =>
                          Image(image: AssetImage(item), width: 45, height: 45))
                      .toList()),
            ),
            switchFunc(),
          ],
        ),
      ),
    );
  }
}
