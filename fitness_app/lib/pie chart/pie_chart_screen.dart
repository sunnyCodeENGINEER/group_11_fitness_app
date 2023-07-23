import 'package:fitness_app/main%20app%20views/workout_screen.dart';
import 'package:fitness_app/models/workout_model.dart';
import 'package:fitness_app/pie%20chart/page/pie_chart_page.dart';
import 'package:flutter/material.dart';

class PieChartMobileScreen extends StatefulWidget {
  const PieChartMobileScreen({super.key});

  @override
  State<PieChartMobileScreen> createState() => _PieChartMobileScreenState();
}

class _PieChartMobileScreenState extends State<PieChartMobileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(
            child: PieChartPage(),
          ),
          MyListTile(
            title: "Banana",
            reps: "2400",
            sets: 10.5,
            unit_1: "Cal",
            unit_2: "grams",
            exercise: modelExercise,
          ),
          MyListTile(
            title: "Banana",
            reps: "2400",
            sets: 10.5,
            unit_1: "Cal",
            unit_2: "grams",
            exercise: modelExercise,
          ),
          MyListTile(
            title: "Banana",
            reps: "2400",
            sets: 10.5,
            unit_1: "Cal",
            unit_2: "grams",
            exercise: modelExercise,
          )
        ],
      ),
    );
  }
}
