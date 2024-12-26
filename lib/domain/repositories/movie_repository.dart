import 'package:flutter_movie_app/domain/entities/movie.dart';

abstract interface class MovieRepository {
  Future<List<Movie>> findMovies(String path);
}
