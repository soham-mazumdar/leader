import 'package:flutter/material.dart';

class Game {
  String name;
  List<Score> scores;
  
  Game({
    @required this.name,
    @required this.scores,
    // this.isSaved
  });

  Game.fromJson(Map<String, dynamic> json){
    List _scores = json['scores'];
    List<Score> scoress = [];
    _scores.forEach((element) {
      scoress.add(Score.fromJson(element));
    });

    name = json['name'];
    scores = scoress;
  }

  Map<String, dynamic> toJson(){
    return {
      "name": this.name,
      "scores": this.scores,
    };
  }

  
}


class Score {
  String username;
  String score;
  
  Score({
    @required this.username,
    @required this.score,
  });

  Score.fromJson(Map<String, dynamic> json){
    username = json['username'];
    score = json['score'];
  }

  Map<String, dynamic> toJson(){
    return {
      "username": this.username,
      "score": this.score,
    };
  }
}