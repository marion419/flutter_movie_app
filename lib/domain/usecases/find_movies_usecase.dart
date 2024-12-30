import 'package:flutter_movie_app/domain/entities/movie.dart';
import 'package:flutter_movie_app/domain/repositories/movie_repository.dart';

class FindMoviesUsecase {
  final MovieRepository _movieRepository;
  FindMoviesUsecase(this._movieRepository);

  Future<List<Movie>> excute(String path) async {
    return await _movieRepository.findMovies(path);
  }
}
