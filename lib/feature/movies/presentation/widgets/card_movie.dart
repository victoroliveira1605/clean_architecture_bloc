import 'package:animations/animations.dart';
import 'package:clean_architecture_movie/core/constants/app_color.dart';
import 'package:clean_architecture_movie/core/constants/strings.dart';
import 'package:clean_architecture_movie/feature/detail/presentation/pages/details_page.dart';
import 'package:clean_architecture_movie/feature/movies/data/models/result._model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardMovie extends StatelessWidget {
  const CardMovie({@required this.item}) : super();
  final ResultModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
        child: OpenContainer(
          closedElevation: 0,
          openElevation: 0,
          closedBuilder: (context, action) => Container(
            color: secondColor,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: item.posterPath != null
                      ? Container(
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500/${item.posterPath}',
                            fit: BoxFit.fill,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes
                                      : null,
                                ),
                              );
                            },
                          ),
                        )
                      : Container(),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset(
                        "assets/icons/star_fill.svg",
                        height: 20,
                      ),
                      SizedBox(width: kDefaultPadding / 2),
                      Text(
                        "${item.voteAverage}",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: whiteColor,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          openBuilder: (context, action) => DetailsPage(movie: item),
        ),
      ),
    );
  }
}
