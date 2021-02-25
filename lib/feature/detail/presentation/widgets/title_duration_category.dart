import 'package:clean_architecture_movie/core/constants/strings.dart';
import 'package:clean_architecture_movie/feature/movies/domain/entities/result.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TitleDurationCategory extends StatelessWidget {
  final Result movie;

  const TitleDurationCategory({Key key, @required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  movie.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: kDefaultPadding / 2),
                Row(
                  children: <Widget>[
                    Text(
                      DateFormat("yyyy").format(
                          DateFormat("yyyy-MM-dd").parse(movie.releaseDate)),
                      style: TextStyle(color: Color(0xFF9A9BB2)),
                    ),
                    SizedBox(width: kDefaultPadding),
                    // Text(
                    //   "GENERO",
                    //   style: TextStyle(color: Color(0xFF9A9BB2)),
                    // ),
                    // SizedBox(width: kDefaultPadding),
                    Text(
                      "2h 32min",
                      style: TextStyle(color: Color(0xFF9A9BB2)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
