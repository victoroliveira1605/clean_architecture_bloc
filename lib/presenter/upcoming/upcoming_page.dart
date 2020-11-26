import 'package:clean_architecture_movie/presenter/upcoming/upcoming_bloc.dart';
import 'package:clean_architecture_movie/presenter/upcoming/upcoming_event.dart';
import 'package:clean_architecture_movie/presenter/upcoming/upcoming_state.dart';
import 'package:clean_architecture_movie/presenter/widget_state.dart';
import 'package:clean_architecture_movie/utils/theme/app_color.dart';
import 'package:flutter/material.dart';

class UpcomingPage extends StatefulWidget {
  UpcomingPage({Key key}) : super(key: key);

  @override
  _UpcomingPageState createState() => _UpcomingPageState();
}

class _UpcomingPageState extends WidgetSate<UpcomingPage, UpcomingBloc> {
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
    return Scaffold(
      backgroundColor: primaryColor,
      body: StreamBuilder<Object>(
          stream: controller,
          builder: (context, snapshot) {
            final state = controller.state;
            if (state is UpcomingLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            // return Container();
            try {
              final list = (state as UpcomingSuccessState).movie.results;
              return GridView.builder(
                itemCount: list.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 5),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    color: secondColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Text(
                              list[index].releaseDate.day.toString() +
                                  '/' +
                                  list[index].releaseDate.month.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: whiteColor)),
                        ),
                        Expanded(
                          child: Container(
                            decoration: new BoxDecoration(
                                image: new DecorationImage(
                              fit: BoxFit.fitWidth,
                              alignment: FractionalOffset.topCenter,
                              image: new NetworkImage(
                                  'https://image.tmdb.org/t/p/w185/${list[index].posterPath}'),
                            )),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          child: RichText(
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                                text: list[index].title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: whiteColor)),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            } catch (e) {
              return Container();
            }
          }),
    );
  }
}
