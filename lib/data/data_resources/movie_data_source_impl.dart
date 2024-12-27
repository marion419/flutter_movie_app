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
        queryParameters: <String, dynamic>{
          'page': 1,
          'include_adult': false,
          'include_video': false,
        },
        options: Options(headers: <String, dynamic>{
          'Authorization': const String.fromEnvironment('Authorization'),
          'Accept': const String.fromEnvironment('Accept'),
          'User-Agent': 'ReadMe-API-Explorer',
        }));

    try {
      if (response.statusCode == 200) {
        print('response found');
        final movies = response.data['results'];
        final iterable = List.from(movies).map((e) {
          return MovieDto.fromJson(e);
        });
        return iterable.toList();
        // final list = jsonDecode(movies);
        // return List.from(list).map((e) => MovieDto.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }
}
