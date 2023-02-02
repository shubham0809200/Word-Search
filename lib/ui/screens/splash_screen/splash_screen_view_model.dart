import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:word_search/core/route_constants.dart';

class SplashScreenViewModel extends BaseViewModel {
  // send to home page after 2 seconds
  nevigateToHomeScreen(BuildContext context) {
    Timer(const Duration(seconds: 3),
        (() => Navigator.pushReplacementNamed(context, homeScreen)));
  }
}
