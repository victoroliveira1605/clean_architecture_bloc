import 'package:clean_architecture_movie/presenter/movies/components/category_list.dart';
import 'package:clean_architecture_movie/presenter/movies/components/movie_carousel.dart';
import 'package:clean_architecture_movie/presenter/movies/movies_bloc.dart';
import 'package:clean_architecture_movie/presenter/movies/movies_event.dart';
import 'package:clean_architecture_movie/presenter/movies/movies_state.dart';
import 'package:clean_architecture_movie/presenter/widget_state.dart';
import 'package:clean_architecture_movie/utils/strings/constants.dart';
import 'package:clean_architecture_movie/utils/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MoviesPage extends StatefulWidget {
  MoviesPage({Key key}) : super(key: key);

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends WidgetSate<MoviesPage, MoviesBloc> {
  Size get size => MediaQuery.of(context).size;
  double get movieItemWidth => size.width / 2 + 48;
  ScrollController backgroundScrollController = ScrollController();
  ScrollController movieScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    controller..add(FetchMovieListEvent());
  }

  @override
  void dispose() {
    super.dispose();
    controller.close();
  }

  @override
  Widget build(BuildContext context) {
    movieScrollController.addListener(() {
      backgroundScrollController
          .jumpTo(movieScrollController.offset * (size.width / movieItemWidth));
    });
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: appbar(),
        body: StreamBuilder<Object>(
            stream: controller,
            builder: (context, snapshot) {
              final state = controller.state;
              if (state is MoviesLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              try {
                final list = (state as MoviesSuccessState).movie.results;
                return SingleChildScrollView(
                    child: Column(
                  children: <Widget>[
                    Categorylist(),
                    // Genres(),
                    SizedBox(height: kDefaultPadding),
                    MovieCarousel(
                      movies: list,
                    ),
                  ],
                ));
              } catch (e) {
                return Container();
              }
            }));
  }

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
}
