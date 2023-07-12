import 'package:fitness_app/models/app_colors.dart';
import 'package:fitness_app/models/workout_model.dart';
import 'package:flutter/material.dart';

class WorkoutTimerMobileScreen extends StatefulWidget {
  const WorkoutTimerMobileScreen({super.key});

  @override
  State<WorkoutTimerMobileScreen> createState() =>
      _WorkoutTimerMobileScreenState();
}

class _WorkoutTimerMobileScreenState extends State<WorkoutTimerMobileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(modelSplit.workout.exercise.name),
          Row(
            children: [
              Text(
                "${modelSplit.workout.exercise.reps} reps",
              ),
              const SizedBox(
                width: 20,
              ),
              Text("${modelSplit.workout.exercise.sets} sets")
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(50),
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
              color: primaryAppColor,
            ),
            child: const Text("Description"),
          )
        ],
      ),
    );
  }
}
