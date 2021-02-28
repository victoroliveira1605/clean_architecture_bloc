import 'package:clean_architecture_movie/core/constants/strings.dart';
import 'package:clean_architecture_movie/feature/detail/domain/entities/cast.dart';
import 'package:clean_architecture_movie/feature/detail/domain/entities/crew.dart';
import 'package:flutter/material.dart';

class CastAndCrew extends StatelessWidget {
  final List<Cast> cast;
  final List<Crew> crew;

  const CastAndCrew({Key key, this.cast, this.crew}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 40, left: 20, bottom: 20),
          child: Text("Elenco",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cast.length,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              width: 80,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://image.tmdb.org/t/p/original/${cast[index].profilePath}'),
                      ),
                    ),
                  ),
                  SizedBox(height: kDefaultPadding / 2),
                  Text(
                    cast[index].originalName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
