import 'package:clean_architecture_triple/core/constants/app_color.dart';
import 'package:clean_architecture_triple/core/error/failures.dart';
import 'package:clean_architecture_triple/core/widget/widget_state.dart';
import 'package:clean_architecture_triple/feature/movies/domain/entities/popular.dart';
import 'package:clean_architecture_triple/feature/movies/presentation/store/movie_store.dart';
import 'package:clean_architecture_triple/feature/movies/presentation/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends WidgetSate<MoviesPage, MovieStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: appbar(),
        body: ScopedBuilder<MovieStore, Failure, Popular>(
          store: store,
          onState: (context, state) => Container(),
          onError: (context, error) => Container(),
          onLoading: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
