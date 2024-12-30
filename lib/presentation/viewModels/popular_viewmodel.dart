import 'dart:async';
import 'package:flutter_movie_app/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_movie_app/presentation/providers.dart';

class PopularViewmodel extends AutoDisposeNotifier<List<Movie>> {
  @override
  List<Movie> build() {
    return [];
  }

  Future<void> findMoviesPopular() async {
    state = await ref.read(findMoviesUsecaseProvider).excutePopluar();
  }
}

final popularViewModel =
    AutoDisposeNotifierProvider<PopularViewmodel, List<Movie>>(
        () => PopularViewmodel());
