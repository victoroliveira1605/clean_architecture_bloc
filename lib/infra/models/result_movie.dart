class Movie {
  final double popularity;
  final int vote_count;
  final bool video;
  final String poster_path;
  final int id;
  final bool adult;
  final String backdrop_path;
  final String original_language;
  final String original_title;
  final List<int> genre_ids;
  final String title;
  final double vote_average;
  final String overview;
  final String release_date;

  Movie(
      {this.popularity,
      this.vote_count,
      this.video,
      this.poster_path,
      this.id,
      this.adult,
      this.backdrop_path,
      this.original_language,
      this.original_title,
      this.genre_ids,
      this.title,
      this.vote_average,
      this.overview,
      this.release_date});
}
