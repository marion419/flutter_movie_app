import 'dart:async';
import 'package:flutter_movie_app/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_movie_app/presentation/providers.dart';

class NowPlayingViewmodel extends AutoDisposeNotifier<List<Movie>> {
  @override
  List<Movie> build() {
    return [];
  }

  Future<List<Movie>> findMoviesNowPlaying() async {
    state = await ref.read(findMoviesUsecaseProvider).excuteNowPlaying();
    return state;
  }
}

final nowPlayingViewModel =
    AutoDisposeNotifierProvider<NowPlayingViewmodel, List<Movie>>(
        () => NowPlayingViewmodel());
