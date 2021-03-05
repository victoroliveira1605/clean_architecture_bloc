import 'package:clean_architecture_bloc/core/constants/app_color.dart';
import 'package:clean_architecture_bloc/core/route/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

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
              child: SvgPicture.asset(
                "assets/icons/popcorn.svg",
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
    Duration(seconds: 3),
    () {
      Navigator.of(context).pushNamed(Routes.MOVIES);
    },
  );
}
