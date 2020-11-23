import 'package:clean_architecture_movie/app_pages.dart';
import 'package:clean_architecture_movie/inject_container.dart';
import 'package:clean_architecture_movie/presenter/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppPages.pages,
      home: SplashPage(),
    ));
  });
}
