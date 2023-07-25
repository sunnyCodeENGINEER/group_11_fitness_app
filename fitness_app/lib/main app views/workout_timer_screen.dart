import 'package:fitness_app/models/app_colors.dart';
import 'package:fitness_app/models/typo.dart';
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
      body: Padding(
        padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackButton(),
            Text(
              widget.exercise.title,
              style: headerTwo,
            ),
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
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(50),
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                  color: primaryAppColor.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(30)),
              child: Text(widget.exercise.description),
            )
          ],
        ),
      ),
    );
  }
}
