import 'dart:async';
import 'package:flutter_movie_app/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_movie_app/presentation/providers.dart';

class Movies {
  List<Movie> nowPlaying;
  List<Movie> popular;
  List<Movie> topRated;
  List<Movie> upComming;
  Movies(
    this.nowPlaying,
    this.popular,
    this.topRated,
    this.upComming,
  );
}

class MovieListViewmodel extends AutoDisposeNotifier<Movies> {
  @override
  Movies build() {
    return Movies([], [], [], []);
  }

  Future<void> findMoviesNowPlaying() async {
    state.nowPlaying = await ref
        .read(findMoviesUsecaseProvider)
        .excute('https://api.themoviedb.org/3/movie/now_playing');
  }

  Future<void> findMoviesPopular() async {
    state.popular = await ref
        .read(findMoviesUsecaseProvider)
        .excute('https://api.themoviedb.org/3/movie/popular');
  }

  Future<void> findMoviesTopRated() async {
    state.topRated = await ref
        .read(findMoviesUsecaseProvider)
        .excute('https://api.themoviedb.org/3/movie/top_rated');
  }

  Future<void> findMoviesUpComming() async {
    state.upComming = await ref
        .read(findMoviesUsecaseProvider)
        .excute('https://api.themoviedb.org/3/movie/up_comming');
  }
}

final movieListViewModel =
    AutoDisposeNotifierProvider<MovieListViewmodel, Movies>(
        () => MovieListViewmodel());
