import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_movie_app/data/data_resources/movie_data_source.dart';
import 'package:flutter_movie_app/data/dto/movie_dto.dart';

class MovieDataSourceImpl implements MovieDataSource {
  final Dio _client = Dio(BaseOptions(
    validateStatus: (status) => true,
  ));

  @override
  Future<List<MovieDto>> findMovies(String path) async {
    final response = await _client.get(path,
        queryParameters: <String, dynamic>{'page': 1, 'language': 'en-US'},
        options: Options(headers: <String, dynamic>{
          'Authorization': const String.fromEnvironment('Authorization'),
          'accept': const String.fromEnvironment('accept'),
        }));

    try {
      if (response.statusCode == 200) {
        final dynamic movies = response.data['results'];
        final list = jsonDecode(movies);
        return List.from(list).map((e) => MovieDto.fromJson(e)).toList();
      }
      return <MovieDto>[];
    } catch (e) {
      print(e);
      return <MovieDto>[];
    }
  }
}
