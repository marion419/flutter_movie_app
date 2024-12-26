class MovieDto {
  String title;
  String posterPath;
  int id;

  MovieDto({
    required this.title,
    required this.posterPath,
    required this.id,
  });

  MovieDto.fromJson(Map<String, dynamic> json)
      : this(
          title: json['title'],
          posterPath: json['posterPath'],
          id: json['id'],
        );

  Map<String, dynamic> toJson() => {
        "title": title,
        "posterPath": posterPath,
        "id": id,
      };
}
