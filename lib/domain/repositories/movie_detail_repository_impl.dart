import 'package:flutter_movie_app/data/data_resources/movie_detail_data_source.dart';
import 'package:flutter_movie_app/domain/entities/movie_detail.dart';
import 'package:flutter_movie_app/domain/repositories/movie_detail_repository.dart';

class MovieDetailRepositoryImpl implements MovieDetailRepository {
  MovieDetailRepositoryImpl(this._movieDetailDataSource);

  final MovieDetailDataSource _movieDetailDataSource;

  @override
  Future<MovieDetail?> findDetail(int id) async {
    final result = await _movieDetailDataSource.findDetail(id);
    if (result != null) {
      return MovieDetail(
          result.title,
          result.overview,
          result.posterPath,
          result.releaseDate,
          result.tagline,
          double.parse(result.popularity),
          double.parse(result.voteAverage),
          int.parse(result.voteCount),
          int.parse(result.budget),
          int.parse(result.revenue),
          int.parse(result.runtime),
          result.genres,
          result.productionCompanies);
    }
    return null;
  }
}
