import 'package:flutter_movie_app/domain/entities/movie_detail.dart';
import 'package:flutter_movie_app/domain/repositories/movie_detail_repository.dart';

class FindDetailUsecase {
  FindDetailUsecase(this._movieDetailRepository);

  final MovieDetailRepository _movieDetailRepository;

  Future<MovieDetail?> excute(int id) async {
    return await _movieDetailRepository.findDetail(id);
  }
}
