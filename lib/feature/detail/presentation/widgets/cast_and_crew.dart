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
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Cast & Crew",
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height: kDefaultPadding),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cast.length,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.only(right: kDefaultPadding),
                width: 80,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/original/${cast[index].profilePath}'),
                        ),
                      ),
                    ),
                    SizedBox(height: kDefaultPadding / 2),
                    Text(
                      cast[index].originalName,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText2,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
