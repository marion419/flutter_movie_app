import 'package:flutter_movie_app/data/data_resources/movie_detail_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('movie detail data source test', () async {
    MovieDetailDataSourceImpl _movieDetailDataSource =
        MovieDetailDataSourceImpl();
    final result = await _movieDetailDataSource.findDetail(845781);
    if (result != null) {
      expect(result.title.length, 7);
      print(result.title);
      print(result.genres[0].name);
    }
    if (result == null) print('failed');
  });
}
