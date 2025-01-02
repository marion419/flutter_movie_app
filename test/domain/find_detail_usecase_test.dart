import 'package:flutter_movie_app/data/data_resources/movie_detail_data_source_impl.dart';
import 'package:flutter_movie_app/domain/repositories/movie_detail_repository_impl.dart';
import 'package:flutter_movie_app/domain/usecases/find_detail_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('find detail usecase test', () async {
    MovieDetailDataSourceImpl _movieDetailDataSource =
        MovieDetailDataSourceImpl();
    MovieDetailRepositoryImpl _movieDetailRepository =
        MovieDetailRepositoryImpl(_movieDetailDataSource);

    final _findDetailUsecase = FindDetailUsecase(_movieDetailRepository);
    final result = await _findDetailUsecase.excute(845781);
    print('${result.productionCompanies.length}');
    print(result.posterPath);
  });
}
