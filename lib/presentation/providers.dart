import 'package:flutter_movie_app/data/data_resources/movie_data_source.dart';
import 'package:flutter_movie_app/data/data_resources/movie_data_source_impl.dart';
import 'package:flutter_movie_app/domain/repositories/movie_repository.dart';
import 'package:flutter_movie_app/domain/repositories/movie_repository_impl.dart';
import 'package:flutter_movie_app/domain/usecases/find_movies_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _movieDataSourceProvider = Provider<MovieDataSource>((ref) {
  return MovieDataSourceImpl();
});

final _movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final dataSource = ref.read(_movieDataSourceProvider);
  return MovieRepositoryImpl(dataSource);
});

final findMoviesUsecaseProvider = Provider((ref) {
  final movieRepo = ref.read(_movieRepositoryProvider);
  return FindMoviesUsecase(movieRepo);
});
