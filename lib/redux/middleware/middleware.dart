import 'package:leader/redux/middleware/GameMiddleware.dart';
import 'package:flutter/material.dart';
import 'package:leader/redux/middleware/navigation_middleware.dart';
import 'package:leader/redux/models/app_state.dart';
import 'package:leader/redux/services/Game.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createMiddleWare(
  GlobalKey<NavigatorState> navigatorKey,
  GameService gameService

)
{
  return [
    ...createGameMiddleware(gameService),
    ...createNavigationMiddleware(navigatorKey),
  ];
}