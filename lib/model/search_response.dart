// import 'movie.dart';

// class SearchResponse {
//   final List<Movie> movies;
//   final String error;

//   SearchResponse(this.movies, this.error);

//   SearchResponse.fromJson(Map<String, dynamic> json)
//       : movies = (json["results"] as List)
//             .map((i) => new Movie.fromJson(i))
//             .toList(),
//         error = "";

//   SearchResponse.withError(String errorValue)
//       : movies = [],
//         error = errorValue;
// }
