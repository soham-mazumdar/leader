import 'package:leader/redux/actions/GameAction.dart';
import 'package:leader/redux/actions/action.dart';
import 'package:leader/redux/models/app_state.dart';
import 'package:leader/redux/services/Game.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createGameMiddleware(
  GameService gameService,
){
	return[
    TypedMiddleware<AppState, InitAppAction>(_init(gameService)),
	  TypedMiddleware<AppState, AddGameAction>(_addGame(gameService)),
    TypedMiddleware<AppState, AddScoreAction>(_addScore(gameService)),
  ];
}



void Function(Store<AppState> store, InitAppAction action, NextDispatcher next)
_init(GameService gameService) {
  	return (store, action, next) {
      gameService.fetchAll().then((value){
        store.dispatch(SaveGamesAction(value));
      });
      
    	next(action);
	};
}

void Function(Store<AppState> store, AddGameAction action, NextDispatcher next)
_addGame(GameService gameService) {
  	return (store, action, next) {

      gameService.addGame(action.game).then((value){
        store.dispatch(SaveGamesAction(value));
      });
      
    	next(action);
	};
}


void Function(Store<AppState> store, AddScoreAction action, NextDispatcher next)
_addScore(GameService gameService) {
  	return (store, action, next) {

      gameService.addScore(action.index, action.score).then((value){
        store.dispatch(SaveGamesAction(value));
      });
      
    	next(action);
	};
}
