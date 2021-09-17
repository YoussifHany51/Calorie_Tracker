import 'dart:convert';

class Meal {
  String name = "";
  var kcal;

  Meal({
    required this.name,
    required this.kcal,
  });
  factory Meal.fromJson(Map<String, dynamic> jsonData) {
    return Meal(name: jsonData['name'], kcal: jsonData['kcal']);
  }

  static Map<String, dynamic> toMap(Meal meal) => {
        'name': meal.name,
        'kcal': meal.kcal,
      };

  static String encode(List<Meal> meals) => json.encode(
      meals.map<Map<String, dynamic>>((meals) => Meal.toMap(meals)).toList());

  static List<Meal> decode(String meals) =>
      (json.decode(meals) as List<dynamic>)
          .map<Meal>((item) => Meal.fromJson(item))
          .toList();
}
