import 'package:leader/redux/actions/action.dart';
import 'package:leader/redux/models/Game.dart';
// import 'package:cbuddy/redux/models/quote.dart';

class AddGameAction extends AppAction{

  final Game game;
  AddGameAction(this.game);

  @override String toString() => "AddGameAction{$game}";
}



class SaveGamesAction extends AppAction{

  final List<Game> games;
  SaveGamesAction(this.games);

  @override String toString() => "SaveGamesAction{$games}";
}


class SaveSelectedGameAction extends AppAction{

  final int index;
  SaveSelectedGameAction(this.index);

  @override String toString() => "SaveSelectedGameAction{$index}";
}


class AddScoreAction extends AppAction{

  final int index;
  final Score score;
  AddScoreAction(this.index, this.score);

  @override String toString() => "AddScoreAction{$index, $score}";
}