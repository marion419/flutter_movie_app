import 'package:flutter_movie_app/domain/entities/movie.dart';
import 'package:flutter_movie_app/domain/repositories/movie_repository.dart';

class FindMoviesUsecase {
  final MovieRepository _movieRepository;
  FindMoviesUsecase(this._movieRepository);

  Future<List<Movie>> excuteNowPlaying() async {
    return await _movieRepository
        .findMovies('https://api.themoviedb.org/3/movie/now_playing');
  }

  Future<List<Movie>> excutePopluar() async {
    return await _movieRepository
        .findMovies('https://api.themoviedb.org/3/movie/popular');
  }

  Future<List<Movie>> excuteTopRated() async {
    return await _movieRepository
        .findMovies('https://api.themoviedb.org/3/movie/top_rated');
  }

  Future<List<Movie>> excuteUpComing() async {
    return await _movieRepository
        .findMovies('https://api.themoviedb.org/3/movie/up_comming');
  }
}
