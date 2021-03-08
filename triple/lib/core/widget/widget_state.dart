import 'package:clean_architecture_triple/inject_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

abstract class WidgetSate<Widget extends StatefulWidget,
    Controller extends Store> extends State<Widget> {
  final Controller store = getIt<Controller>();
}
