import 'package:leader/redux/actions/navigator_actions.dart';
import 'package:leader/redux/models/Game.dart';
import 'package:leader/redux/models/app_state.dart';
import 'package:leader/redux/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class LeaderboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Map<String, dynamic>>(converter: (store) {
      final Map<String, dynamic> args = {
        "games": store.state.games,
        "selectedGame": store.state.selectedGame,
        "addScore": () {
          return store.dispatch(NavigatorPushAction(AppRoutes.addScore));
        },
      };
      return args;
    }, builder: (context, args) {
      final List<Game> games = args["games"];
      final int selectedGame = args["selectedGame"];
      final Function addScore = args["addScore"];

      Game game = games[selectedGame];

      return Scaffold(
        appBar: AppBar(
          title: Text(game.name),
          actions: [IconButton(icon: Icon(Icons.add), onPressed: addScore)],
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4),
                      bottomLeft: Radius.circular(4),
                      bottomRight: Radius.circular(4)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(game.scores[index].username),
                    ),
                    Text(game.scores[index].score),
                  ],
                ));
          },
          itemCount: game.scores.length,
        ),
      );
    });
  }
}
