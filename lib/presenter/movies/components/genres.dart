import 'package:clean_architecture_movie/utils/strings/constants.dart';
import 'package:clean_architecture_movie/utils/theme/app_color.dart';
import 'package:flutter/material.dart';

class Genres extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> genres = [
      "Action",
      "Crime",
      "Comedy",
      "Drama",
      "Horror",
      "Animation"
    ];
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      height: 36,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: genres.length,
        itemBuilder: (context, index) => Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: kDefaultPadding),
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
            vertical: kDefaultPadding / 4, // 5 padding top and bottom
          ),
          decoration: BoxDecoration(
            border: Border.all(color: whiteColor),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            genres[index],
            style: TextStyle(color: whiteColor.withOpacity(0.8), fontSize: 16),
          ),
        ),
      ),
    );
  }
}
