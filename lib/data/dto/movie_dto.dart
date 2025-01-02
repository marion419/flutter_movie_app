class MovieDto {
  String title;
  String? posterPath;
  int id;

  MovieDto({
    required this.title,
    required this.posterPath,
    required this.id,
  }) {
    if (posterPath != null) {
      posterPath = 'https://image.tmdb.org/t/p/original$posterPath';
    }
  }

  MovieDto.fromJson(Map<String, dynamic> json)
      : this(
          title: json['title'],
          posterPath: json['poster_path'],
          id: json['id'],
        );

  Map<String, dynamic> toJson() => {
        "title": title,
        "poster-path": posterPath,
        "id": id,
      };
}
