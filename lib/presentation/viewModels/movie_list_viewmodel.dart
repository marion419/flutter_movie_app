import 'dart:async';
import 'package:flutter_movie_app/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_movie_app/presentation/providers.dart';

class MovieListViewmodel extends AutoDisposeNotifier<List<Movie>> {
  @override
  List<Movie> build() {
    return [];
  }

  Future<void> findMoviesNowPlaying() async {
    state = await ref.read(findMoviesUsecaseProvider).excuteNowPlaying();
  }

  Future<void> findMoviesPopular() async {
    state = await ref.read(findMoviesUsecaseProvider).excutePopluar();
  }

  Future<void> findMoviesTopRated() async {
    state = await ref.read(findMoviesUsecaseProvider).excuteTopRated();
  }

  Future<void> findMoviesUpComming() async {
    state = await ref.read(findMoviesUsecaseProvider).excuteUpComming();
  }
}

final movieListViewModel =
    AutoDisposeNotifierProvider<MovieListViewmodel, List<Movie>>(
        () => MovieListViewmodel());
