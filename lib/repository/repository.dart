import 'package:movieapp/model/cast_response.dart';
import 'package:movieapp/model/genre_response.dart';
import 'package:movieapp/model/movie_detail_response.dart';
import 'package:movieapp/model/persons_detail_response.dart';
import 'package:movieapp/model/movie_response.dart';
import 'package:movieapp/model/search_response.dart';
import 'package:dio/dio.dart';
import 'package:movieapp/model/person_response.dart';
import 'package:movieapp/model/video_response.dart';

class MovieRepository {
  final String apiKey = "d319f841b8717fae98abb91921bed989";
  static String mainUrl = "https://api.themoviedb.org/3";
  final Dio _dio = Dio();

  var getTrendingUrl = '$mainUrl/trending/all/day';
  var getMoviesUrl = '$mainUrl/discover/movie';
  var getPlayingUrl = '$mainUrl/movie/now_playing';
  var getGenresUrl = "$mainUrl/genre/movie/list";
  var getPersonsUrl = "$mainUrl/person/popular";
  var movieUrl = "$mainUrl/movie";
  var searchMovieUrl = "$mainUrl/search/movie";

  // Future<SearchResponse> getSearch() async {
  //   var params = {"api_key": apiKey, "language": "en-US"};
  //   try {
  //     Response response =
  //         await _dio.get(searchMovieUrl, queryParameters: params);
  //     return SearchResponse.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     print("Exception occured: $error stackTrace: $stacktrace");
  //     return SearchResponse.withError("$error");
  //   }
  // }

  Future<MovieResponse> getMovies() async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      Response response =
          await _dio.get(getTrendingUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<MovieResponse> getPlayingMovies() async {
    var params = {"api_key": apiKey, "language": "en-US", "page": 1};
    try {
      Response response =
          await _dio.get(getPlayingUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<GenreResponse> getGenres() async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      Response response = await _dio.get(getGenresUrl, queryParameters: params);
      return GenreResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return GenreResponse.withError("$error");
    }
  }

  Future<PersonsResponse> getPersons() async {
    var params = {"api_key": apiKey};
    try {
      Response response =
          await _dio.get(getPersonsUrl, queryParameters: params);
      return PersonsResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return PersonsResponse.withError("$error");
    }
  }

  Future<MovieResponse> getMovieByGenre(int id) async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
      "page": 1,
      "with_genres": id
    };
    try {
      Response response = await _dio.get(getMoviesUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<MovieDetailResponse> getMovieDetail(int id) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      Response response =
          await _dio.get(movieUrl + "/$id", queryParameters: params);
      return MovieDetailResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieDetailResponse.withError("$error");
    }
  }

  // Future<PersonsDetailResponse> getPersonsDetail(int id) async {
  //   var params = {"api_key": apiKey, "language": "en-US"};
  //   try {
  //     Response response =
  //         await _dio.get(movieUrl + "/$id", queryParameters: params);
  //     return PersonsDetailResponse.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     print("Exception occured: $error stackTrace: $stacktrace");
  //     return PersonsDetailResponse.withError("$error");
  //   }
  // }

  Future<VideoResponse> getMovieVideos(int id) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      Response response = await _dio.get(movieUrl + "/$id" + "/videos",
          queryParameters: params);
      return VideoResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return VideoResponse.withError("$error");
    }
  }

  Future<MovieResponse> getSimilarMovies(int id) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      Response response = await _dio.get(movieUrl + "/$id" + "/similar",
          queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<CastResponse> getCasts(int id) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      Response response = await _dio.get(movieUrl + "/$id" + "/credits",
          queryParameters: params);
      return CastResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return CastResponse.withError("$error");
    }
  }
}
