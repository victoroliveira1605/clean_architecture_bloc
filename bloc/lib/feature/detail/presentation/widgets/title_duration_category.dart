import 'package:clean_architecture_bloc/core/constants/app_color.dart';
import 'package:clean_architecture_bloc/core/constants/strings.dart';
import 'package:clean_architecture_bloc/feature/detail/domain/entities/detail.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TitleDurationCategory extends StatelessWidget {
  final Detail detail;

  const TitleDurationCategory({Key? key, required this.detail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  detail.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: kDefaultPadding / 2),
                Row(
                  children: <Widget>[
                    Text(
                      DateFormat("yyyy").format(
                          DateFormat("yyyy-MM-dd").parse(detail.releaseDate)),
                      style: TextStyle(
                          color: textAceent, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: kDefaultPadding),
                    // Text(
                    //   "GENERO",
                    //   style: TextStyle(color: Color(0xFF9A9BB2)),
                    // ),
                    // SizedBox(width: kDefaultPadding),
                    Text(
                      detail.runtime.toString() + ' min',
                      style: TextStyle(
                          color: textAceent, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
