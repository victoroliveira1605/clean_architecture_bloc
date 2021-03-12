import 'package:clean_architecture_triple/core/constants/app_color.dart';
import 'package:clean_architecture_triple/core/error/failures.dart';
import 'package:clean_architecture_triple/core/widget/widget_state.dart';
import 'package:clean_architecture_triple/feature/movies/data/models/result._model.dart';
import 'package:clean_architecture_triple/feature/movies/presentation/store/movie_store.dart';
import 'package:clean_architecture_triple/feature/movies/presentation/widgets/app_bar.dart';
import 'package:clean_architecture_triple/feature/movies/presentation/widgets/card_movie.dart';
import 'package:clean_architecture_triple/feature/movies/presentation/widgets/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends WidgetSate<MoviesPage, MovieStore> {
  Widget _buildList(List<ResultModel> _movies) {
    return Column(
      children: [
        Category(
          onSelectChange: (int index) => {},
          selected: 0,
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _movies.length,
            itemBuilder: (_, index) => CardMovie(
              item: _movies[index],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildError(Failure error) {
    if (error is EmptyList) {
      return Center(
        child: Text('Nada encontrado'),
      );
    } else if (error is ServerFailure) {
      return Center(
        child: Text('Erro no servidor'),
      );
    } else {
      return Center(
        child: Text('Erro interno'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: appbar(),
        body: Column(
          children: [
            Expanded(
              child: ScopedBuilder<MovieStore, Failure, List<ResultModel>>(
                store: store,
                onState: (context, state) => _buildList(state),
                onError: (_, error) {
                  return _buildError(error!);
                },
                onLoading: (context) => Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ));
  }
}
