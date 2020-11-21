import 'package:clean_architecture_movie/presenter/upcoming/upcoming_bloc.dart';
import 'package:clean_architecture_movie/presenter/widget_state.dart';
import 'package:flutter/material.dart';

class UpcomingPage extends StatefulWidget {
  UpcomingPage({Key key}) : super(key: key);

  @override
  _UpcomingPageState createState() => _UpcomingPageState();
}

class _UpcomingPageState extends WidgetSate<UpcomingPage, UpcomingBloc> {
  @override
  void initState() {
    controller.moviesUpcomingUseCase.call();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.close();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
