import 'package:leader/redux/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:leader/redux/actions/navigator_actions.dart';
import 'package:leader/redux/actions/GameAction.dart';
import 'package:leader/redux/models/app_state.dart';
import 'package:leader/redux/models/Game.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Map<String, dynamic>>(converter: (store) {
      final Map<String, dynamic> args = {
        "games": store.state.games,
        "addGame": () {
          return store.dispatch(NavigatorPushAction(AppRoutes.addGame));
        },
        "gamePage": (index) {
          store.dispatch(SaveSelectedGameAction(index));
          return store.dispatch(NavigatorPushAction(AppRoutes.leaderboard));
        },
      };
      return args;
    }, builder: (context, args) {
      final Function addGame = args["addGame"];
      final List<Game> games = args["games"];
      final Function gamePage = args["gamePage"];

      return Scaffold(
          appBar: AppBar(
            title: Text('Games'),
            actions: [IconButton(icon: Icon(Icons.add), onPressed: addGame)],
          ),
          body: SafeArea(
            child: ListView.builder(
              itemCount: games.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    gamePage(index);
                  },
                  child: Container(
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
                    child: Text(games[index].name),
                  ),
                );
              },
            ),
          ));
    });
  }
}
