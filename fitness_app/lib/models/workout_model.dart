class Split {
  final int id;
  final String name;
  final int monday;
  final int tuesday;
  final int wednesday;
  final int thursday;
  final int friday;
  final int saturday;
  final int sunday;

  Split({
    required this.id,
    required this.name,
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
    required this.sunday,
  });

  List<dynamic> toList() {
    return [
      id,
      name,
      monday,
      tuesday,
      wednesday,
      thursday,
      friday,
      saturday,
      sunday
    ];
  }
}

class Workout {
  final int id;
  final String name;
  // final int estimatedDuration;
  // final Exercise exercise;

  Workout(this.id, this.name);
  List<dynamic> toList() {
    return [id, name];
  }
}

class Exercise {
  final int id;
  final String title;
  final String description;
  final String bodyPart;
  final String equipment;
  final double rating;

  Exercise({
    required this.id,
    required this.title,
    required this.description,
    required this.bodyPart,
    required this.equipment,
    required this.rating,
  });

  List<dynamic> toList() {
    return [id, title, description, bodyPart, equipment, rating];
  }
}

Split modelSplit = Split(
  id: 1,
  name: "name",
  monday: 0,
  tuesday: 0,
  wednesday: 0,
  thursday: 0,
  friday: 0,
  saturday: 0,
  sunday: 0,
);

Workout modelWorkout = Workout(0, "name");

Exercise modelExercise = Exercise(
  id: 0,
  title: "title",
  description: "description",
  bodyPart: "bodyPart",
  equipment: "equipment",
  rating: 0.0,
);

List<Exercise> exercisesInWorkout = [];

List<Workout> weeklyWorkouts = [];
