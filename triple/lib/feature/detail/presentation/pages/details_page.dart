import 'package:clean_architecture_triple/core/constants/app_color.dart';
import 'package:clean_architecture_triple/feature/movies/domain/entities/result.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final Result movie;
  const DetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: primaryColor, body: Container());
  }
}
