import 'package:clean_architecture_bloc/core/constants/app_color.dart';
import 'package:clean_architecture_bloc/feature/detail/domain/entities/cast.dart';
import 'package:clean_architecture_bloc/feature/detail/domain/entities/crew.dart';
import 'package:clean_architecture_bloc/feature/detail/presentation/bloc/credit_bloc.dart';
import 'package:clean_architecture_bloc/feature/detail/presentation/bloc/credit_event.dart';
import 'package:clean_architecture_bloc/feature/detail/presentation/bloc/credit_state.dart';
import 'package:clean_architecture_bloc/feature/detail/presentation/bloc/detail_bloc.dart';
import 'package:clean_architecture_bloc/feature/detail/presentation/bloc/detail_event.dart';
import 'package:clean_architecture_bloc/feature/detail/presentation/bloc/detail_state.dart';
import 'package:clean_architecture_bloc/feature/detail/presentation/widgets/backdrop_rating.dart';
import 'package:clean_architecture_bloc/feature/detail/presentation/widgets/cast_and_crew.dart';
import 'package:clean_architecture_bloc/feature/detail/presentation/widgets/synope.dart';
import 'package:clean_architecture_bloc/feature/detail/presentation/widgets/title_duration_category.dart';
import 'package:clean_architecture_bloc/feature/movies/domain/entities/result.dart';
import 'package:clean_architecture_bloc/inject_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsPage extends StatefulWidget {
  final Result movie;
  const DetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final List<Cast> _cast = [];
  final List<Crew> _crew = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider<CreditBloc>(
            create: (context) => getIt<CreditBloc>()
              ..add(GetCastCrewEvent(id: widget.movie.id))),
        BlocProvider<DetailBloc>(
            create: (context) =>
                getIt<DetailBloc>()..add(GetDetailEvent(id: widget.movie.id))),
      ],
      child: Scaffold(
          backgroundColor: primaryColor,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackdropAndRating(size: size, movie: widget.movie),
                BlocConsumer<DetailBloc, DetailState>(
                  listener: (context, state) {
                    if (state is DetailLoadingState) {
                      CircularProgressIndicator();
                    } else if (state is DetailLoadFailedState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Falha ao carregar !')));
                    }
                  },
                  builder: (context, state) {
                    if (state is DetailInitialState) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is DetailLoadSuccessState) {
                      return TitleDurationCategory(detail: state.detail);
                    }
                    return Container();
                  },
                ),
                Synope(
                  synope: widget.movie.overview,
                ),
                BlocConsumer<CreditBloc, CreditState>(
                  listener: (context, state) {
                    if (state is CreditLoadingState) {
                      CircularProgressIndicator();
                    } else if (state is CreditLoadFailedState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Falha ao carregar !')));
                    }
                  },
                  builder: (context, state) {
                    if (state is CreditInitialState) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is CreditsLoadSuccessState) {
                      _cast.addAll(state.credits.cast);
                      _crew.addAll(state.credits.crew);
                    }
                    return CastAndCrew(
                      cast: _cast,
                      crew: _crew,
                    );
                  },
                ),
              ],
            ),
          )),
    );
  }
}
