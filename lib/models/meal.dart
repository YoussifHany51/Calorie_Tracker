import 'package:hive/hive.dart';

//part 'meal.g.dart';

@HiveType(typeId: 0)
class Meal extends HiveObject {
  @HiveField(0)
  late String name;
  @HiveField(1)
  var kcal;
  @HiveField(2)
  late DateTime? date;
  Meal({
    required this.name,
    required this.kcal,
    this.date,
  });

  // Map<String, dynamic> toMap() {
  //   final map = Map<String, dynamic>();
  //   // ignore: unnecessary_null_comparison
  //   if (id != null) {
  //     map['id'] = id;
  //   }
  //   map['id'] = id;
  //   map['name'] = name;
  //   map['kcal'] = kcal;
  //   return map;
  // }

  // factory Meal.fromMap(Map<String, dynamic> map) {
  //   return Meal.withId(
  //     id: map['id'],
  //     name: map['name'],
  //     kcal: map['kcal'],
  //   );
  // }
}
