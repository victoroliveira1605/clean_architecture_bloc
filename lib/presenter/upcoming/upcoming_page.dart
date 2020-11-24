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
            final list = (state as UpcomingSuccessState).movie.results;
            return GridView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                itemCount: list.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          height: 150,
                          child: Image.network(
                              'https://image.tmdb.org/t/p/w185/${list[index].posterPath}',
                              fit: BoxFit.fill),
                        ),
                        Expanded(
                            flex: 1,
                            child: Container(
                                margin: EdgeInsets.only(top: 6),
                                child: Text(list[index].title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: whiteColor))))
                      ],
                    ),
                  );
                  // return Card(
                  //   child: Column(
                  //     children: [
                  //       Expanded(
                  //         child: Image.network(
                  //           'https://image.tmdb.org/t/p/w185/${list[index].posterPath}',
                  //           fit: BoxFit.contain,
                  //         ),
                  //       ),
                  //       Expanded(child: Text(list[index].title))
                  //     ],
                  //   ),
                  // );
                });
          }),
    );
  }
}
