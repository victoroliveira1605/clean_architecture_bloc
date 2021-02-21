import 'package:clean_architecture_movie/core/constants/app_color.dart';
import 'package:clean_architecture_movie/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar appbar() {
  return AppBar(
    backgroundColor: primaryColor,
    elevation: 0,
    leading: IconButton(
      padding: EdgeInsets.only(left: kDefaultPadding),
      icon: SvgPicture.asset(
        "assets/icons/menu.svg",
        color: whiteColor,
      ),
      onPressed: () {},
    ),
    actions: <Widget>[
      IconButton(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        icon: SvgPicture.asset(
          "assets/icons/search.svg",
          color: whiteColor,
        ),
        onPressed: () {},
      ),
    ],
  );
}
