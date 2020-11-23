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
      body: Column(
        children: [
          StreamBuilder<Object>(
              stream: controller,
              builder: (context, snapshot) {
                final state = controller.state;
                if (state is UpcomingLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Container();
                // final list = (state as UpcomingSuccessState).movie.results;
                // return GridView.builder(
                //     itemCount: list.length,
                //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //         crossAxisCount: 2),
                //     itemBuilder: (BuildContext context, int index) {
                //       return Text(list[index].originalTitle);
                //     });
              })
        ],
      ),
    );
  }
}
