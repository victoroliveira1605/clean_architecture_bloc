import 'package:clean_architecture_movie/core/constants/app_color.dart';
import 'package:clean_architecture_movie/feature/detail/presentation/widgets/backdrop_rating.dart';
import 'package:clean_architecture_movie/feature/detail/presentation/widgets/title_duration_category.dart';
import 'package:clean_architecture_movie/feature/movies/domain/entities/result.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final Result movie;
  const DetailsPage({Key key, @required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BackdropAndRating(size: size, movie: movie),
            TitleDurationCategory(movie: movie)
          ],
        ),
      ),
    );
  }
}
