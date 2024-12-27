import 'package:flutter_movie_app/data/data_resources/movie_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('movie data source test', () async {
    MovieDataSourceImpl movieDataSource = MovieDataSourceImpl();
    final result = await movieDataSource
        .findMovies('https://api.themoviedb.org/3/movie/now_playing');
    expect(result.isEmpty, false);
  });
}
