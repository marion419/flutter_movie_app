import 'package:flutter_movie_app/data/data_resources/movie_data_source_impl.dart';
import 'package:flutter_movie_app/domain/repositories/movie_repository_impl.dart';
import 'package:flutter_movie_app/domain/usecases/find_movies_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('find movies usecase test', () async {
    // 데이터 소스
    MovieDataSourceImpl _movieDataSource = MovieDataSourceImpl();
    // 데이터소스 -> 레포지토리
    MovieRepositoryImpl _movieRepository =
        MovieRepositoryImpl(_movieDataSource);
    // 레포지토리 -> usecase
    final _findMoviesUsecase = FindMoviesUsecase(_movieRepository);
    // usecase의 excute 함수 실행
    final result = await _findMoviesUsecase.excuteNowPlaying();
    expect(result.isEmpty, false);
    print(result[0].posterPath);
  });
}
