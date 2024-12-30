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
          // 'Authorization': const String.fromEnvironment('Authorization'),
          // 'Accept': const String.fromEnvironment('Accept'),
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNDdhYWE2ZjUyZDA5ODI3YjEzN2E3ZjUxNmM3MTAwMCIsIm5iZiI6MTczNDk0ODk2NC41NzMsInN1YiI6IjY3NjkzODY0NjE3OGZjYmJlYWM0ZGZjNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.wpHPPQ9ZALOKA3vKe29N0p4tVAd2wjowBQOOoNPp3n8',
          'Accept': 'application/json',
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
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }
}
