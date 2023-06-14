class WorkoutBanner {
  final int id;
  final String name;
  // final Strng thumbnail;

  WorkoutBanner(this.id, this.name);
}

// sample data
List<WorkoutBanner> workoutBannerList = [
  WorkoutBanner(1, "Chest"),
  WorkoutBanner(2, "Back"),
  WorkoutBanner(3, "Legs"),
  WorkoutBanner(4, "Arms"),
  WorkoutBanner(5, "Abs"),
  WorkoutBanner(6, "Glutes"),
];

class MealBanner {
  final int id;
  final String name;
  // final Strng thumbnail;

  MealBanner(this.id, this.name);
}

// sample data
List<MealBanner> mealBannerList = [
  MealBanner(1, "Breakfast"),
  MealBanner(2, "Lunch"),
  MealBanner(3, "Dinner"),
];
