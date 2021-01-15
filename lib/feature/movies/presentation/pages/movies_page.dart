import 'package:clean_architecture_movie/core/constants/app_color.dart';
import 'package:clean_architecture_movie/core/constants/strings.dart';
import 'package:clean_architecture_movie/feature/movies/presentation/bloc/movies_bloc.dart';
import 'package:clean_architecture_movie/feature/movies/presentation/bloc/movies_state.dart';
import 'package:clean_architecture_movie/feature/movies/presentation/widgets/category.dart';
import 'package:clean_architecture_movie/feature/movies/presentation/widgets/movie_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key key}) : super(key: key);

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: appbar(),
        body: BlocBuilder<MoviesBloc, MoviesState>(
          builder: (context, state) {
            if (state is MoviesInitialState) {
              return Container();
            } else if (state is MoviesLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MoviesLoadSuccessState) {
              return SingleChildScrollView(
                  child: Column(
                children: <Widget>[
                  Category(
                    onSelectChange: (int index) {
                      setState(() {
                        selected = index;
                        print(selected);
                      });
                    },
                    selected: selected,
                  ),
                  // Genres(),
                  SizedBox(height: kDefaultPadding),
                  MovieCarousel(
                    movies: state.movies.results,
                  ),
                ],
              ));
            } else if (state is MoviesLoadFailedState) {
              return Center(child: Text('Falha ao carregar'));
            } else {
              return Center(child: Text('Unexpected State'));
            }
          },
        ));
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
