class Company {
  String name;
  String? logoPath;
  Company({required this.name, required this.logoPath}) {
    if (logoPath != null) {
      logoPath = 'https://image.tmdb.org/t/p/original$logoPath';
    }
  }

  Company.fromJson(Map<String, dynamic> json)
      : this(
          name: json["name"],
          logoPath: json["logo_path"] != null ? json["logo_path"] : null,
        );

  Map<String, dynamic> toJson() => {
        "name": name,
        "logo_path": logoPath,
      };
}
