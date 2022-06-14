class DependentModel {
  final int? id;
  final String name;
  final String relation;
  final String gender;
  final String age;

  DependentModel({
    this.id,
    required this.name,
    required this.relation,
    required this.gender,
    required this.age,
  });

  factory DependentModel.fromJson(Map<String, dynamic> json) {
    return DependentModel(
      id: json["id"],
      name: json["name"],
      relation: json["relation"],
      gender: json["gender"],
      age: json["age"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "relation": relation,
        "gender": gender,
        "age": age,
      };
}
