import 'package:dio/dio.dart';
import 'package:flutter_movie_app/data/data_resources/movie_detail_data_source.dart';
import 'package:flutter_movie_app/data/dto/movie_detail_dto.dart';

class MovieDetailDataSourceImpl implements MovieDetailDataSource {
  final Dio _client = Dio(BaseOptions(
    validateStatus: (status) => true,
  ));

  @override
  Future<MovieDetailDto?> findDetail(int id) async {
    final response = await _client.get(
      'https://api.themoviedb.org/3/movie/$id',
      options: Options(
        headers: <String, dynamic>{
          'Authorization': const String.fromEnvironment('Authorization'),
          'Accept': const String.fromEnvironment('Accept'),
          'User-Agent': 'ReadMe-API-Explorer',
        },
      ),
    );
    try {
      if (response.statusCode == 200) {
        print('detail response found');
        final movieDetail = response.data.map((e) {
          return MovieDetailDto.fromJson(e);
        });
        return movieDetail;
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
