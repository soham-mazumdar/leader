import 'package:leader/redux/actions/GameAction.dart';
import 'package:leader/redux/actions/action.dart';
import 'package:leader/redux/models/Game.dart';
import 'package:redux/redux.dart';


final gamesReducer = combineReducers<List<Game>>([
  new TypedReducer<List<Game>, SaveGamesAction>(_saveGames),
]);

List<Game> _saveGames(List<Game> meds, SaveGamesAction action) => action.games;


final selectedGameReducer = combineReducers<int>([
  new TypedReducer<int, SaveSelectedGameAction>(_saveSelectedGame),
]);

int _saveSelectedGame(int meds, SaveSelectedGameAction action) {
  return action.index;
}