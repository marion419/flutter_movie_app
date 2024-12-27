import 'dart:convert';

import 'package:flutter_movie_app/data/dto/movie_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('movie dto test', () {
    String dummyData = """
    {
      "title": "title",
      "posterPath": "Path",
      "id": 3
    }
""";

    Map<String, dynamic> map = jsonDecode(dummyData);
    MovieDto movieDto = MovieDto.fromJson(map);
    expect(movieDto.title, "title");
  });
}
