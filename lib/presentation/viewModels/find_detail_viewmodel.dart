import 'dart:async';
import 'package:flutter_movie_app/domain/entities/movie_detail.dart';
import 'package:flutter_movie_app/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FindDetailViewmodel extends AutoDisposeNotifier<MovieDetail> {
  FindDetailViewmodel();

  @override
  MovieDetail build() {
    return MovieDetail(
      'title',
      'overview',
      'posterPath',
      'releaseDate',
      'tagline',
      0,
      0,
      0,
      0,
      0,
      0,
      [],
      [],
    );
  }

  Future<void> findDetail(int id) async {
    state = await ref.read(findDetailUsecaseProvider).excute(id);
  }
}

final findDetailViewmodel =
    AutoDisposeNotifierProvider<FindDetailViewmodel, MovieDetail>(
        () => FindDetailViewmodel());
