
import 'package:leader/redux/models/app_state.dart';
import 'package:leader/redux/reducers/navigation_reducer.dart';
import 'package:leader/redux/reducers/game_reducer.dart';

AppState baseReducer(AppState oldState, dynamic action)
{
  return oldState.copyWith(
    newRoutes: navigationReducer(oldState.routes, action),
    newGames: gamesReducer(oldState.games, action),
    newSelectedGame: selectedGameReducer(oldState.selectedGame, action)
  );
}