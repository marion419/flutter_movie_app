import 'package:flutter_movie_app/domain/entities/movie.dart';

abstract interface class MovieRepository {
  Future<List<Movie>> moviesNowPlaying();
  Future<List<Movie>> moviesPopular();
  Future<List<Movie>> moviesTopRated();
  Future<List<Movie>> moviesUpcoming();
}
