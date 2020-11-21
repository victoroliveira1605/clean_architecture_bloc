import 'package:clean_architecture_movie/app_pages.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _onChangeScreen(context);
    return Container(
      color: Colors.amber,
    );
  }
}

_onChangeScreen(BuildContext context) async {
  return await Future.delayed(
    Duration(seconds: 5),
    () {
      Navigator.of(context).pushNamed(Routes.UPCOMING);
    },
  );
}
