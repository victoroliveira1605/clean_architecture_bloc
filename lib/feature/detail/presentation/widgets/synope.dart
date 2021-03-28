import 'package:clean_architecture_bloc/core/constants/app_color.dart';
import 'package:clean_architecture_bloc/core/constants/strings.dart';
import 'package:flutter/material.dart';

class Synope extends StatelessWidget {
  final String synope;
  const Synope({Key? key, required this.synope}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
          child: Text(
            detail_summarie,
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Text(
            synope,
            style: TextStyle(
              color: whiteColor,
            ),
          ),
        )
      ],
    );
  }
}
