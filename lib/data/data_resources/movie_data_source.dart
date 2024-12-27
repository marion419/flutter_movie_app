import 'package:flutter_movie_app/data/dto/movie_dto.dart';

abstract interface class MovieDataSource {
  Future<List<MovieDto>> findMovies(String path);
}
