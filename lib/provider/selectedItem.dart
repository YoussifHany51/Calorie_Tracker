import 'package:calorie_tracker/models/meals.dart';
import 'package:flutter/widgets.dart';

class SelectedItem extends ChangeNotifier {
  List<Meal> meals = [];
  int totalCal = 0;
  int currentKcal = 0;
  addItem(Meal meal) {
    meals.add(meal);
    totalCal += conertToInt(meal.kcal);
    currentKcal = conertToInt(meal.kcal);
    notifyListeners();
  }

  int get totalCalories {
    return totalCal;
  }

  int get currKcalFunction {
    return currentKcal;
  }

  int conertToInt(String value) {
    return int.parse(value);
  }
}
