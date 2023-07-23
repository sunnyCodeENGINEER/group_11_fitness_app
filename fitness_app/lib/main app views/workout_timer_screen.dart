import 'package:fitness_app/models/app_colors.dart';
import 'package:fitness_app/models/user_model.dart';
import 'package:fitness_app/models/workout_model.dart';
import 'package:flutter/material.dart';

class WorkOutTimerScreen extends StatefulWidget {
  final Exercise exercise;
  const WorkOutTimerScreen({super.key, required this.exercise});

  @override
  State<WorkOutTimerScreen> createState() => _WorkOutTimerScreenState();
}

class _WorkOutTimerScreenState extends State<WorkOutTimerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MediaQuery.of(context).size.width <=
              MediaQuery.of(context).size.height
          ? WorkoutTimerMobileScreen(
              exercise: widget.exercise,
            )
          : WorkoutTimerMobileScreen(
              exercise: widget.exercise,
            ),
    );
  }
}

class WorkoutTimerMobileScreen extends StatefulWidget {
  final Exercise exercise;
  const WorkoutTimerMobileScreen({super.key, required this.exercise});

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
          Text(widget.exercise.title),
          Row(
            children: [
              Text(
                "${modelLevel.repsPerSet} reps",
              ),
              const SizedBox(
                width: 20,
              ),
              Text("${modelLevel.sets} sets")
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
            child: Text(widget.exercise.description),
          )
        ],
      ),
    );
  }
}
