import 'package:flutter_movie_app/data/data_resources/movie_detail_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('movie detail data source test', () async {
    MovieDetailDataSourceImpl _movieDetailDataSource =
        MovieDetailDataSourceImpl();
    final result = await _movieDetailDataSource.findDetail(238);
    if (result != null) {
      expect(result.title.length, 13);
      print(result.title);
      print('${result.productionCompanies[1].logoPath}');
    }
    if (result == null) print('failed');
  });
}
