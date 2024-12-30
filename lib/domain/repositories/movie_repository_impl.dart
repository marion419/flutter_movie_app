import 'package:flutter_movie_app/data/data_resources/movie_data_source.dart';
import 'package:flutter_movie_app/domain/entities/movie.dart';
import 'package:flutter_movie_app/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(this._movieDataSource);

  final MovieDataSource _movieDataSource;

  @override
  Future<List<Movie>> findMovies(String path) async {
    final result = await _movieDataSource.findMovies(path);
    return result
        .map(
          (e) => Movie(
            e.title, // 제목
            e.posterPath, // 포스터 링크
            e.id, // 영화 아이디
          ),
        )
        .toList();
  }
}
