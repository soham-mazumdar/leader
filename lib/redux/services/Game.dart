import 'dart:convert';
import 'package:leader/redux/models/Game.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameService {

    
  Future<List<Game>> addGame(Game game) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String prefGames = prefs.getString('games') == null ? '[]' : prefs.getString('games');

    List games = jsonDecode(prefGames);
    List<Game> gamess = [] ;
    games.forEach((element) {
      print('object');
      gamess.add(Game.fromJson(element));
    });
    gamess.add(game);
    
    String gamesStr = jsonEncode(gamess);
  
    await prefs.setString('games', gamesStr);
    return gamess;
  }

  // get quotes from API
  Future<List<Game>> fetchAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.remove('games');
    String prefGames = prefs.getString('games') == null ? '[]' : prefs.getString('games');
    List decGames = jsonDecode(prefGames);
    List<Game> gamess = [];
    decGames.forEach((element) {
      gamess.add(Game.fromJson(element));
    });

    return gamess;
  }

  
  // Add Score
  Future<List<Game>> addScore(int index,Score score) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String prefGames = prefs.getString('games') == null ? '[]' : prefs.getString('games');
    List decGames = jsonDecode(prefGames);
    List<Game> gamess = [];
    decGames.forEach((element) {
      gamess.add(Game.fromJson(element));
    });
    
    gamess[index].scores.add(score);
    String gamesStr = jsonEncode(gamess);
    
    await prefs.setString('games', gamesStr);
    

    return gamess;
  }
}