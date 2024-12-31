import 'package:flutter_movie_app/domain/entities/movie_detail.dart';

abstract interface class MovieDetailRepository {
  Future<MovieDetail?> findDetail(int id);
}
