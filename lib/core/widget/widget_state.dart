import 'package:bloc/bloc.dart';
import 'package:clean_architecture_movie/inject_container.dart';
import 'package:flutter/material.dart';

abstract class WidgetSate<Widget extends StatefulWidget,
    Controller extends Bloc> extends State<Widget> {
  final Controller controller = getIt<Controller>();
}
