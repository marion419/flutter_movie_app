import 'package:flutter_movie_app/data/dto/company.dart';
import 'package:flutter_movie_app/data/dto/genre.dart';

class MovieDetailDto {
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

  MovieDetailDto({
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.tagline,
    required this.popularity,
    required this.voteAverage,
    required this.voteCount,
    required this.budget,
    required this.revenue,
    required this.runtime,
    required this.genres,
    required this.productionCompanies,
  }) {
    if (posterPath != null) {
      posterPath = 'https://image.tmdb.org/t/p/original$posterPath';
    }
  }

  MovieDetailDto.fromJson(Map<dynamic, dynamic> json)
      : this(
          title: json['title'],
          overview: json['overview'],
          posterPath: json['poster_path'],
          releaseDate: json['release_date'],
          tagline: json['tagline'],
          popularity: json['popularity'],
          voteAverage: json['vote_average'],
          voteCount: json['vote_count'],
          budget: json['budget'],
          revenue: json['revenue'],
          runtime: json['runtime'],
          // genres: (json['genres'] as List<Genre>),
          // productionCompanies:
          //     (json['production_companies'] as List<Company>),
          genres:
              (json['genres'] as List).map((e) => Genre.fromJson(e)).toList(),
          productionCompanies: (json['production_companies'] as List)
              .map((e) => Company.fromJson(e))
              .toList(),
        );

  Map<dynamic, dynamic> toJson() => {
        "title": title,
        "overview": overview,
        "poster-path": posterPath,
        "release_date": releaseDate,
        "tagline": tagline,
        "popularity": popularity,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "budget": budget,
        "revenue": revenue,
        "runtime": runtime,
        "genres": genres,
        "production_companies": productionCompanies,
      };
}
