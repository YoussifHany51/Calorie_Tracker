class Meal {
  int id = 0;
  String name = "";
  var kcal;

  Meal({
    required this.name,
    required this.kcal,
  });
  Meal.withId({
    required this.id,
    required this.name,
    required this.kcal,
  });

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    // ignore: unnecessary_null_comparison
    if (id != null) {
      map['id'] = id;
    }
    map['id'] = id;
    map['name'] = name;
    map['kcal'] = kcal;
    return map;
  }

  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal.withId(
      id: map['id'],
      name: map['name'],
      kcal: map['kcal'],
    );
  }
}
