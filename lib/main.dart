import 'package:clean_architecture_movie/app_pages.dart';
import 'package:clean_architecture_movie/inject_container.dart';
import 'package:clean_architecture_movie/presenter/splash/splash_page.dart';
import 'package:flutter/material.dart';

void main() async {
  configureDependencies();
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.blue, canvasColor: Colors.white),
    routes: AppPages.pages,
    home: SplashPage(),
  ));
}
