import 'dart:convert';
import 'package:flutter_movie_app/data/dto/movie_detail_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('movie detail dto test', () {
    String dummyData = """
    {
    "title": "title",
    "overview": "overview",
    "poster_path": "poster_path",
    "release_date": "releaseDate",
    "tagline": "tagline",
    "popularity": 0.0,
    "vote_average": 0.0,
    "vote_count": 0,
    "budget": 0,
    "revenue": 0,
    "runtime": 0,
    "genres": [{"name": "a"},{"name": "b"}],
    "production_companies": [{"name": "a", "logo_path": "aPath"},{"name": "b", "logo_path": "bPath"}]
    }
""";

    Map<String, dynamic> map = jsonDecode(dummyData);
    MovieDetailDto movieDetailDto = MovieDetailDto.fromJson(map);
    expect(movieDetailDto.title, "title");
    print(movieDetailDto.productionCompanies[0].name);
  });
}
