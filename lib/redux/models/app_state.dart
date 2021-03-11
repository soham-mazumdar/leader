import 'package:leader/redux/models/Game.dart';
import 'package:leader/redux/routes/routes.dart';

class AppState {
  final List<String> routes;
  
  final List<Game> games;
  final int selectedGame;
  

  AppState({
    this.routes,

    this.games,
    this.selectedGame,
  });

  factory AppState.initial(){
    return AppState(
      routes: [AppRoutes.home],
      games: []
    );
  }

  AppState copyWith({
    bool newIsLoading,
    List<String> newRoutes,

    List<Game> newGames,
    int newSelectedGame
  })
  {
    return AppState(
      routes: newRoutes ?? this.routes,
      games: newGames ?? this.games,
      selectedGame: newSelectedGame ?? this.selectedGame
    );
  }
}