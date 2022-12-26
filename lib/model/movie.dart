class Movie {
  final int id;
  final num popularity;
  final String title;
  final String name;
  final String backPoster;
  final String poster;
  final String overview;
  final num rating;

  Movie(this.id, this.popularity, this.title, this.name, this.backPoster,
      this.poster, this.overview, this.rating);

  Movie.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        popularity = json["popularity"],
        title = json["title"],
        name = json["name"],
        backPoster = json["backdrop_path"],
        poster = json["poster_path"],
        overview = json["overview"],
        rating = json["vote_average"].toDouble();
}
