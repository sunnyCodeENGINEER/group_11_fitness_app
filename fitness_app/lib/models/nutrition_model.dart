class Food {
  int id;
  String name;
  int calories;
  String time;

  Food(
      {required this.id,
      required this.name,
      required this.calories,
      required this.time});
}

Food modelFood = Food(id: 0, name: "name", calories: 0, time: "time");

class Ingredient {
  int id;
  String name;
  String serving;
  String calories;
  String foodGroup;

  Ingredient(
      {required this.id,
      required this.name,
      required this.serving,
      required this.calories,
      required this.foodGroup});
}

Ingredient modelIngredient = Ingredient(
    id: 0, name: "name", serving: "0", calories: "0", foodGroup: "foodGroup");

class Snack {
  int id;
  String name;
  String serving;
  int calories;

  Snack(
      {required this.id,
      required this.name,
      required this.serving,
      required this.calories});
}

Snack modelSnack = Snack(id: 0, name: "name", serving: "0", calories: 0);

class MealPlan {
  int id;
  String name;
  int breakfast;
  int lunch;
  int dinner;

  MealPlan(
      {required this.id,
      required this.name,
      required this.breakfast,
      required this.lunch,
      required this.dinner});
}

MealPlan modelPlan =
    MealPlan(id: 1, name: "name", breakfast: 0, lunch: 0, dinner: 0);

class WeightGoal {
  int id;
  String name;
  double servingMult;

  WeightGoal({required this.id, required this.name, required this.servingMult});
}

WeightGoal modelWeightGoal = WeightGoal(id: 2, name: "name", servingMult: 0);

List<Food> dailyFood = [];

List<Ingredient> ingredientsInFood = [];

List<Ingredient> proteins = [];
List<Ingredient> carbohydrates = [];
List<Ingredient> fats = [];
