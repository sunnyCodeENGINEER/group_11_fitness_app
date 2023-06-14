class Split {
  final int id;
  final String name;
  final Workout workout;

  Split(this.id, this.name, this.workout);
}

class Workout {
  final int id;
  final String name;
  final int estimatedDuration;
  final Exercise exercise;

  Workout(this.id, this.name, this.estimatedDuration, this.exercise);
}

class Exercise {
  final int id;
  final String name;
  final int reps;
  final int sets;
  final int duration;
  final int restDuration;

  Exercise(
    this.id,
    this.name,
    this.reps,
    this.sets,
    this.duration,
    this.restDuration,
  );
}

// model split
Split modelSplit = Split(
  1,
  'Push Pull Legs',
  Workout(
    1,
    'Chest',
    60,
    Exercise(1, 'Bench press', 12, 4, 60, 30),
  ),
);
