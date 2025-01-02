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
    "popularity": "popularity",
    "vote_average": "voteAverage",
    "vote_count": "voteCount",
    "budget": "budget",
    "revenue": "revenue",
    "runtime": "runtime",
    "genres": [{"name": "a"},{"name":"b"}],
    "production_companies": [{"name": "a"},{"name":"b"}]
    }
""";

    Map<String, dynamic> map = jsonDecode(dummyData);
    MovieDetailDto movieDetailDto = MovieDetailDto.fromJson(map);
    expect(movieDetailDto.title, "title");
    print(movieDetailDto.genres[0].name);
  });
}
