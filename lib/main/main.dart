import 'package:clean_architecture_movie/main/inject_container.dart';
import 'package:clean_architecture_movie/presenter/splash/splash_page.dart';
import 'package:flutter/material.dart';

void main() async {
  setupInjection();
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.blue, canvasColor: Colors.white),
    //rotas
    home: SplashPage(),
  ));
}
