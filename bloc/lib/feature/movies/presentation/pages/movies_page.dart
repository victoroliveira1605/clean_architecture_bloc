import 'package:clean_architecture_bloc/core/constants/app_color.dart';
import 'package:clean_architecture_bloc/feature/movies/data/models/result._model.dart';
import 'package:clean_architecture_bloc/feature/movies/domain/entities/movies_enum.dart';
import 'package:clean_architecture_bloc/feature/movies/presentation/bloc/movies_bloc.dart';
import 'package:clean_architecture_bloc/feature/movies/presentation/bloc/movies_event.dart';
import 'package:clean_architecture_bloc/feature/movies/presentation/bloc/movies_state.dart';
import 'package:clean_architecture_bloc/feature/movies/presentation/widgets/app_bar.dart';
import 'package:clean_architecture_bloc/feature/movies/presentation/widgets/card_movie.dart';
import 'package:clean_architecture_bloc/feature/movies/presentation/widgets/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key key}) : super(key: key);

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  int _selected = 0;
  final List<ResultModel> _movies = [];
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: appbar(),
        body: BlocConsumer<MoviesBloc, MoviesState>(
          listener: (context, state) {
            if (state is MoviesLoadingState) {
              return Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('Carregando...')));
            } else if (state is MoviesLoadFailedState) {
              return Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('Falha ao carregar !')));
            }
          },
          builder: (context, state) {
            if (state is MoviesInitialState ||
                state is MoviesLoadingState && _movies.isEmpty) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MoviesLoadSuccessState) {
              _movies.addAll(state.movies.results);
              context.watch<MoviesBloc>().isFetching = false;
            }
            return Column(
              children: [
                Category(
                  onSelectChange: (int index) {
                    setState(() {
                      _selected = index;
                      _movies.clear();
                      context.read<MoviesBloc>()..page = 1;
                      context.read<MoviesBloc>()
                        ..isFetching = true
                        ..add(_selected == MoviesEnum.SOON.index
                            ? GetAllSoonEvent()
                            : GetAllNewShowingEvent());
                    });
                  },
                  selected: _selected,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _movies.length,
                    controller: _scrollController
                      ..addListener(() {
                        if (_scrollController.offset ==
                                _scrollController.position.maxScrollExtent &&
                            !context.read<MoviesBloc>().isFetching) {
                          context.read<MoviesBloc>()
                            ..page = context.read<MoviesBloc>().page + 1;
                          context.read<MoviesBloc>()
                            ..isFetching = true
                            ..add(_selected == MoviesEnum.SOON.index
                                ? GetAllSoonEvent()
                                : GetAllNewShowingEvent());
                        }
                      }),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => CardMovie(
                      item: _movies[index],
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
