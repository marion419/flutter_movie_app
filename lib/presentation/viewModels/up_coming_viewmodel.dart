import 'dart:async';
import 'package:flutter_movie_app/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_movie_app/presentation/providers.dart';

class UpComingViewmodel extends AutoDisposeNotifier<List<Movie>> {
  @override
  List<Movie> build() {
    return [];
  }

  Future<void> findMoviesUpComing() async {
    state = await ref.read(findMoviesUsecaseProvider).excuteUpComing();
  }
}

final upComingViewmodel =
    AutoDisposeNotifierProvider<UpComingViewmodel, List<Movie>>(
        () => UpComingViewmodel());
