import 'package:leader/redux/services/Game.dart';
import 'package:leader/ui/screens/AddScorePage.dart';
import 'package:leader/ui/screens/LeaderboardPage.dart';
import 'package:leader/ui/screens/AddGamePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:leader/redux/actions/action.dart';
import 'package:leader/redux/middleware/middleware.dart';
import 'package:leader/redux/models/app_state.dart';
import 'package:leader/redux/reducers/base_reducer.dart';
import 'package:leader/redux/routes/routes.dart';
import 'package:leader/ui/screens/HomePage.dart';
import 'package:redux/redux.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Store<AppState> store = Store<AppState>(
    baseReducer,
    initialState: AppState.initial(),

    middleware: createMiddleWare(
      navigatorKey,
      GameService(),
    )
  );
  store.dispatch(InitAppAction());
  return runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  
  final Store<AppState> store;

  MyApp(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: StoreConnector<AppState, Map<String, dynamic>>(
        converter: (store)
        {
          final Map<String, dynamic> args = {
            // "ui": store.state.ui,
            // "services" : store.state.services,
            // "doctors" : store.state.doctors,
          };
          return args;
        },
        builder: (context, args){
          return MaterialApp(
            // initialRoute: '/',
            debugShowCheckedModeBanner : false,
            navigatorKey:navigatorKey,
            navigatorObservers: [routeObserver],
            // theme: getThemeData(),
            onGenerateRoute: (RouteSettings settings) => _resolveRoute(settings),
          );
        }
      )
      
      
    );
  }

  PageRoute _resolveRoute(RouteSettings settings)
	{
      switch(settings.name)
        {
          case AppRoutes.addGame:
              return FabRoute(AddGamePage(), settings: settings);
              break;
          case AppRoutes.leaderboard:
              return FabRoute(LeaderboardPage(), settings: settings);
              break;
          case AppRoutes.addScore:
              return FabRoute(AddScorePage(), settings: settings,);
              break;
          default :
            return MainRoute(HomePage(), settings : settings,);
            
        }
	}

}