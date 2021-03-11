import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:leader/redux/actions/navigator_actions.dart';
import 'package:leader/redux/actions/GameAction.dart';
import 'package:leader/redux/models/app_state.dart';
import 'package:leader/redux/models/Game.dart';

class AddGamePage extends StatelessWidget {
  final TextEditingController g = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Map<String, dynamic>>(converter: (store) {
      final Map<String, dynamic> args = {
        "submit": () {
          Game game = Game(name: g.text, scores: []);
          store.dispatch(AddGameAction(game));
          store.dispatch(NavigatorPopAction());
        },
      };
      return args;
    }, builder: (context, args) {
      final Function submit = args["submit"];

      return Scaffold(
          appBar: AppBar(title: Text('Add Game')),
          body: ListView(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: TextField(
                  controller: g,
                  decoration: InputDecoration(
                    labelText: 'Game Name',
                    enabledBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      borderSide: new BorderSide(color: Colors.grey),
                    ),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: GestureDetector(
                    onTap: submit,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 7),
                      alignment: Alignment.center,
                      color: Theme.of(context).primaryColor,
                      child: Text('Submit'),
                    )),
              )
            ],
          ));
    });
  }
}
