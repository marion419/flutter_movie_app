import 'package:flutter_movie_app/data/dto/company.dart';
import 'package:flutter_movie_app/data/dto/genre.dart';

class MovieDetail {
  String title; // 제목
  String overview; // 설명
  String? posterPath; // 포스터 URL
  String releaseDate; // 개봉일
  String tagline; // 태그라인
  double popularity; // 인기 점수
  double voteAverage; // 평점
  int voteCount; // 평점 투표수
  int budget; // 예산
  int revenue; // 수익
  int runtime; // 러닝타임
  List<Genre> genres; // 장르 배열
  List<Company> productionCompanies; // 배급사 배열

  MovieDetail(
    this.title,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.tagline,
    this.popularity,
    this.voteAverage,
    this.voteCount,
    this.budget,
    this.revenue,
    this.runtime,
    this.genres,
    this.productionCompanies,
  );
}
