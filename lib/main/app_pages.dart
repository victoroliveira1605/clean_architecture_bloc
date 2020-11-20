import 'package:clean_architecture_movie/presenter/splash/splash_page.dart';
import 'package:clean_architecture_movie/presenter/upcoming/upcoming_page.dart';
import 'package:flutter/material.dart';

abstract class AppPages {
  static final Map<String, Widget Function(BuildContext)> pages = {
    Routes.SPLASH: (context) => new SplashPage(),
    Routes.UPCOMING: (context) => new UpcomingPage(),
  };
}

abstract class Routes {
  static const SPLASH = '/splash';
  static const UPCOMING = '/upcoming';
}
