import 'package:flutter/material.dart';
import 'package:word_search/core/route_constants.dart';
import 'package:word_search/ui/screens/home_screen/home_screen_view.dart';
import 'package:word_search/ui/screens/splash_screen/splash_screen_view.dart';
import 'package:word_search/ui/screens/value_input_screen/value_input_screen_view.dart';
import 'package:word_search/ui/screens/word_check_screen/word_check_screen_view.dart';

import 'fade_transition.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case splashScreen:
        return FadeRoute(page: const SplashScreenView());

      case homeScreen:
        return FadeRoute(page: const HomeScreenView());

      case valueInputScreen:
        ValueInputScreenView? arguments = args as ValueInputScreenView?;
        return FadeRoute(
            page: ValueInputScreenView(
          row: arguments!.row,
          column: arguments.column,
        ));

      case wordSearchScreen:
        WordSearchScreenView? arguments = args as WordSearchScreenView?;
        return FadeRoute(
            page: WordSearchScreenView(
          row: args!.row,
          column: args.column,
          gridList: args.gridList,
        ));

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text('ERROR ROUTE'),
        ),
      );
    });
  }
}
