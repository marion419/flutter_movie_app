class Genre {
  String name;
  Genre({required this.name});

  Genre.fromJson(Map<String, dynamic> json)
      : this(
          name: json["name"],
        );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
