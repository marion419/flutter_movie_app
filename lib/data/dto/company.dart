class Company {
  String name;
  Company({required this.name});

  Company.fromJson(Map<String, dynamic> json)
      : this(
          name: json["name"],
        );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
