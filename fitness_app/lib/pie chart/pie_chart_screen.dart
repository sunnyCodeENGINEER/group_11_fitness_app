import 'package:fitness_app/main%20app%20views/workout_screen.dart';
import 'package:fitness_app/models/workout_model.dart';
import 'package:fitness_app/pie%20chart/data/pie_data.dart';
import 'package:fitness_app/pie%20chart/page/pie_chart_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/nutrition_model.dart';

class PieChartMobileScreen extends StatefulWidget {
  const PieChartMobileScreen({super.key});

  @override
  State<PieChartMobileScreen> createState() => _PieChartMobileScreenState();
}

class _PieChartMobileScreenState extends State<PieChartMobileScreen> {
  // List<Ingredient> proteins = [];
  // List<Ingredient> carbohydrates = [];
  // List<Ingredient> fats = [];
  double proteinPercentage = 40;
  double carbsPercentage = 50;
  double fatsPercentage = 10;
  String selection = "none";

  @override
  void initState() {
    super.initState();
    // Your function will be called as soon as the screen is created.
    myFunction();
  }

  void myFunction() {
    // Your code here: This function will run when the screen is created.
    double totalProtein = 0;
    double totalCarbs = 0;
    double totalFats = 0;
    double totalCalories = 0;
    for (var i in ingredientsInFood) {
      print(i.id);
      print(i.name);
      print(i.serving);
      print(i.calories);
      i.calories =
          (double.parse(i.calories) * modelWeightGoal.servingMult).toString();
      totalCalories += double.parse(i.calories);
      if (i.foodGroup == "Protein") {
        print(i.calories);
        proteins.add(i);
        totalProtein += double.parse(i.calories);
      } else if (i.foodGroup == "Fats & Oils") {
        fats.add(i);
        totalFats += double.parse(i.calories);
      } else {
        carbohydrates.add(i);
        totalCarbs += double.parse(i.calories);
      }
    }
    print(totalProtein);

    proteinPercentage = totalProtein / totalCalories * 100;
    fatsPercentage = totalFats / totalCalories * 100;
    carbsPercentage = totalCarbs / totalCalories * 100;
    proteinPercent = proteinPercentage;
    fatsPercent = fatsPercentage;
    carbsPercent = carbsPercentage;

    print(proteinPercentage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Row(
              children: [const BackButton()],
            ),

            const Expanded(
              child: PieChartPage(),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: ingredientsInFood.length,
                itemBuilder: (context, index) {
                  return MyListTile(
                    title: ingredientsInFood[index].name,
                    reps: ingredientsInFood[index].calories,
                    unit_1: 'Cals',
                    // exercise: modelExercise,
                  );
                },
              ),
            ),
            // MyListTile(
            //   title: "Banana",
            //   reps: "2400",
            //   sets: 10.5,
            //   unit_1: "Cal",
            //   unit_2: "grams",
            //   exercise: modelExercise,
            // ),
            // MyListTile(
            //   title: "Banana",
            //   reps: "2400",
            //   sets: 10.5,
            //   unit_1: "Cal",
            //   unit_2: "grams",
            //   exercise: modelExercise,
            // ),
            // MyListTile(
            //   title: "Banana",
            //   reps: "2400",
            //   sets: 10.5,
            //   unit_1: "Cal",
            //   unit_2: "grams",
            //   exercise: modelExercise,
            // )
          ],
        ),
      ),
    );
  }
}

class BackButton extends StatefulWidget {
  const BackButton({super.key});

  @override
  State<BackButton> createState() => _BackButtonState();
}

class _BackButtonState extends State<BackButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.chevron_left),
      onPressed: () => Get.back(),
    );
  }
}
