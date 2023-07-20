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
    return [id, name, monday, tuesday, wednesday, thursday, friday, saturday, sunday];
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

// model split
// Split modelSplit = Split(
//   1,
//   'Push Pull Legs',
//   Workout(
//     1,
//     'Chest',
//     60,
//     Exercise(1, 'Bench press', 12, 4, 60, 30),
//   ),
// );
