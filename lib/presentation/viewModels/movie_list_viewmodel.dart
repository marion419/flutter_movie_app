import 'dart:async';
import 'package:flutter_movie_app/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_movie_app/presentation/providers.dart';

class MovieListViewmodel extends AutoDisposeNotifier<List<Movie>> {
  @override
  List<Movie> build() {
    findMovies();
    return [];
  }

  Future<void> findMovies() async {
    state = await ref.read(findMoviesUsecaseProvider).excute('path');
  }
}
