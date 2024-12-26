import 'package:dio/dio.dart';
import 'package:flutter_movie_app/domain/entities/movie.dart';
import 'package:flutter_movie_app/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  @override
  Future<List<Movie>> findMovies(String path) async {
    final Dio _client = Dio(BaseOptions(
      validateStatus: (status) => true,
    ));

    final response = await _client.get(path,
        queryParameters: <String, dynamic>{'page': 1, 'language': 'en-US'},
        options: Options(headers: <String, dynamic>{
          'Authorization': const String.fromEnvironment('Authorization'),
          'accept': const String.fromEnvironment('accept'),
        }));

    try {
      if (response.statusCode == 200) {
        final dynamic movies = response.data['results'];
        final Iterable<Movie> iterable =
            List<dynamic>.from(movies).map<Movie>((dynamic e) {
          return movies.fromJson(e);
        });
        return iterable.toList();
      }
      return <Movie>[];
    } catch (e) {
      print(e);
      return <Movie>[];
    }
  }
}
