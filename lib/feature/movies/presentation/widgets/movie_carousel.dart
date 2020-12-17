import 'package:clean_architecture_movie/core/constants/app_color.dart';
import 'package:clean_architecture_movie/core/constants/strings.dart';
import 'package:clean_architecture_movie/feature/movies/domain/entities/result.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:animations/animations.dart';
import 'package:flutter_svg/svg.dart';

class MovieCarousel extends StatefulWidget {
  final List<Result> movies;
  const MovieCarousel({Key key, this.movies}) : super(key: key);

  @override
  _MovieCarouselState createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  PageController _pageController;
  int initialPage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: initialPage,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: AspectRatio(
        aspectRatio: 0.80,
        child: PageView.builder(
          onPageChanged: (value) {
            setState(() {
              initialPage = value;
            });
          },
          controller: _pageController,
          physics: ClampingScrollPhysics(),
          itemCount: widget.movies.length, // we have 3 demo movies
          itemBuilder: (context, index) => AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double value = 0;
              if (_pageController.position.haveDimensions) {
                value = index - _pageController.page;
                value = (value * 0.038).clamp(-1, 1);
              }
              return AnimatedOpacity(
                duration: Duration(milliseconds: 150),
                opacity: initialPage == index ? 1 : 0.5,
                child: Transform.rotate(
                  angle: math.pi * value,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: OpenContainer(
                      closedElevation: 0,
                      openElevation: 0,
                      closedBuilder: (context, action) => Container(
                        color: secondColor,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [kDefaultShadow],
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500/${widget.movies[index].posterPath}'),
                                  ),
                                ),
                              ),
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
                                    "${widget.movies[index].voteAverage}",
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
                      openBuilder: (context, action) => Container(),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
