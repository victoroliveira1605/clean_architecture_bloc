import 'package:clean_architecture_movie/app_pages.dart';
import 'package:clean_architecture_movie/utils/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _onChangeScreen(context);
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 280,
              height: 280,
              child: FlareActor(
                'assets/animated/PopCorn.flr',
                animation: 'Go',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
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
