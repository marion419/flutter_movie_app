import 'package:flutter_movie_app/data/data_resources/movie_data_source.dart';
import 'package:flutter_movie_app/data/data_resources/movie_data_source_impl.dart';
import 'package:flutter_movie_app/data/data_resources/movie_detail_data_source.dart';
import 'package:flutter_movie_app/data/data_resources/movie_detail_data_source_impl.dart';
import 'package:flutter_movie_app/domain/repositories/movie_detail_repository.dart';
import 'package:flutter_movie_app/domain/repositories/movie_detail_repository_impl.dart';
import 'package:flutter_movie_app/domain/repositories/movie_repository.dart';
import 'package:flutter_movie_app/domain/repositories/movie_repository_impl.dart';
import 'package:flutter_movie_app/domain/usecases/find_detail_usecase.dart';
import 'package:flutter_movie_app/domain/usecases/find_movies_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// movie

final _movieDataSourceProvider = Provider<MovieDataSource>((ref) {
  return MovieDataSourceImpl();
});

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final dataSource = ref.read(_movieDataSourceProvider);
  return MovieRepositoryImpl(dataSource);
});

final findMoviesUsecaseProvider = Provider((ref) {
  final movieRepo = ref.read(movieRepositoryProvider);
  return FindMoviesUsecase(movieRepo);
});

// movieDetail

final _movieDetailDataSourceProvider = Provider<MovieDetailDataSource>((ref) {
  return MovieDetailDataSourceImpl();
});

final _movieDetailRepositoryProvider = Provider<MovieDetailRepository>((ref) {
  final detailDataSource = ref.read(_movieDetailDataSourceProvider);
  return MovieDetailRepositoryImpl(detailDataSource);
});

final findDetailUsecaseProvider = Provider((ref) {
  final detailRepo = ref.read(_movieDetailRepositoryProvider);
  return FindDetailUsecase(detailRepo);
});
