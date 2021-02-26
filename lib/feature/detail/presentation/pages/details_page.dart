import 'package:clean_architecture_movie/core/constants/app_color.dart';
import 'package:clean_architecture_movie/feature/detail/domain/entities/cast.dart';
import 'package:clean_architecture_movie/feature/detail/domain/entities/crew.dart';
import 'package:clean_architecture_movie/feature/detail/presentation/bloc/detail_bloc.dart';
import 'package:clean_architecture_movie/feature/detail/presentation/bloc/detail_event.dart';
import 'package:clean_architecture_movie/feature/detail/presentation/bloc/detail_state.dart';
import 'package:clean_architecture_movie/feature/detail/presentation/widgets/backdrop_rating.dart';
import 'package:clean_architecture_movie/feature/detail/presentation/widgets/cast_and_crew.dart';
import 'package:clean_architecture_movie/feature/detail/presentation/widgets/title_duration_category.dart';
import 'package:clean_architecture_movie/feature/movies/domain/entities/result.dart';
import 'package:clean_architecture_movie/inject_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsPage extends StatefulWidget {
  final Result movie;
  const DetailsPage({Key key, @required this.movie}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final List<Cast> _cast = [];
  final List<Crew> _crew = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider<DetailBloc>(
      create: (context) =>
          getIt<DetailBloc>()..add(GetCastCrewEvent(id: widget.movie.id)),
      child: Scaffold(
          backgroundColor: primaryColor,
          body: BlocConsumer<DetailBloc, DetailState>(
            listener: (context, state) {
              if (state is DetailLoadingState) {
                return Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Carregando...')));
              } else if (state is DetailLoadFailedState) {
                return Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('Falha ao carregar !')));
              }
            },
            builder: (context, state) {
              if (state is DetailInitialState || state is DetailLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is DetailLoadSuccessState) {
                _cast.addAll(state.credits.cast);
                _crew.addAll(state.credits.crew);
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BackdropAndRating(size: size, movie: widget.movie),
                  TitleDurationCategory(movie: widget.movie),
                  CastAndCrew(
                    cast: _cast,
                    crew: _crew,
                  )
                ],
              );
            },
          )),
    );
  }
}
