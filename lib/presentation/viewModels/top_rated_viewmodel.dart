import 'dart:async';
import 'package:flutter_movie_app/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_movie_app/presentation/providers.dart';

class TopRatedViewmodel extends AutoDisposeNotifier<List<Movie>> {
  @override
  List<Movie> build() {
    return [];
  }

  Future<void> findMoviesTopRated() async {
    state = await ref.read(findMoviesUsecaseProvider).excuteTopRated();
  }
}

final topRatedViewmodel =
    AutoDisposeNotifierProvider<TopRatedViewmodel, List<Movie>>(
        () => TopRatedViewmodel());
