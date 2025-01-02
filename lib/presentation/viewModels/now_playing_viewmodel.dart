import 'dart:async';
import 'package:flutter_movie_app/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_movie_app/presentation/providers.dart';

class Movies {
  List<Movie> nowPlaying;
  List<Movie> popular;
  List<Movie> topRated;
  List<Movie> upcoming;
  Movies(this.nowPlaying, this.popular, this.topRated, this.upcoming);
}

class NowPlayingViewmodel extends AutoDisposeNotifier<Movies> {
  List<Movie> nowPlaying = [];
  List<Movie> popular = [];
  List<Movie> topRated = [];
  List<Movie> upcoming = [];

  @override
  Movies build() {
    return Movies(nowPlaying, popular, topRated, upcoming);
  }

  Future<void> findMoviesNowPlaying() async {
    nowPlaying = await ref.read(findMoviesUsecaseProvider).excuteNowPlaying();
    popular = await ref.read(findMoviesUsecaseProvider).excutePopluar();
    topRated = await ref.read(findMoviesUsecaseProvider).excuteTopRated();
    upcoming = await ref.read(findMoviesUsecaseProvider).excuteUpComing();
    state = Movies(nowPlaying, popular, topRated, upcoming);
  }
}

final nowPlayingViewModel =
    AutoDisposeNotifierProvider<NowPlayingViewmodel, Movies>(
        () => NowPlayingViewmodel());
