import 'package:fitness_app/create_account_screen.dart';
import 'package:fitness_app/models/typo.dart';
import 'package:fitness_app/select_workout_split.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SelectMealPlanScreen extends StatefulWidget {
  const SelectMealPlanScreen({super.key});

  @override
  State<SelectMealPlanScreen> createState() => _SelectMealPlanScreenState();
}

class _SelectMealPlanScreenState extends State<SelectMealPlanScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MediaQuery.of(context).size.width <=
              MediaQuery.of(context).size.height
          ? const SelectMealPlanMobileScreen()
          : const SelectMealPlanDesktopScreen(),
    );
  }
}

class SelectMealPlanMobileScreen extends StatefulWidget {
  const SelectMealPlanMobileScreen({super.key});

  @override
  State<SelectMealPlanMobileScreen> createState() =>
      _SelectMealPlanMobileScreenState();
}

class _SelectMealPlanMobileScreenState
    extends State<SelectMealPlanMobileScreen> {
  String selectedValue = 'Omnivorous';

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(value: "Omnivorous", child: Text("Omnivorous")),
      DropdownMenuItem(value: "Carnivorous", child: Text("Carnivorous")),
      DropdownMenuItem(value: "Vegetarian", child: Text("Vegetarian")),
      DropdownMenuItem(value: "Custom", child: Text("Custom")),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'Choose your Meal Plan',
                    style: headerOne,
                  ),
                  Text(
                    'What is your current Diet goal?',
                    style: headerTwo,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MediumAppButton(level: 'Lose Weight'),
                      SizedBox(
                        width: 5,
                      ),
                      MediumAppButton(level: 'Maintain Weight'),
                      SizedBox(
                        width: 5,
                      ),
                      MediumAppButton(level: 'Gain Weight'),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  Text(
                    'Choose a diet type',
                    style: headerTwo,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          // enabledBorder: OutlineInputBorder(
                          //   borderSide:
                          //       const BorderSide(color: Colors.purple, width: 2),
                          //   borderRadius: BorderRadius.circular(20),
                          // ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.purple, width: 10),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 176, 151, 180),
                        ),
                        dropdownColor: const Color.fromARGB(255, 176, 151, 180),
                        value: selectedValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                        items: dropdownItems),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    selectedValue == 'Custom'
                        ? 'Custom Workouts can be set up later.'
                        : '',
                    style: const TextStyle(
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const LargeAppButton(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SelectMealPlanDesktopScreen extends StatefulWidget {
  const SelectMealPlanDesktopScreen({super.key});

  @override
  State<SelectMealPlanDesktopScreen> createState() =>
      _SelectMealPlanDesktopScreenState();
}

class _SelectMealPlanDesktopScreenState
    extends State<SelectMealPlanDesktopScreen> {
  String selectedValue = 'Push Pull Legs';

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(value: "Push Pull Legs", child: Text("Push Pull Legs")),
      DropdownMenuItem(
          value: "Upper Lower Split", child: Text("Upper Lower Split")),
      DropdownMenuItem(value: "Full Body", child: Text("Full Body")),
      DropdownMenuItem(value: "Custom", child: Text("Custom")),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'Choose your Meal Plan',
                    style: headerOne,
                  ),
                  Text(
                    'What is your current Diet goal?',
                    style: headerTwo,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MediumAppButton(
                        level: 'Lose Weight',
                        width: 150,
                        height: 60,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      MediumAppButton(
                        level: 'Maintain Weight',
                        width: 150,
                        height: 60,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      MediumAppButton(
                        level: 'Gain Weight',
                        width: 150,
                        height: 60,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  Text(
                    'Choose a diet type',
                    style: headerTwo,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.purple, width: 10),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 176, 151, 180),
                        ),
                        dropdownColor: const Color.fromARGB(255, 176, 151, 180),
                        value: selectedValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                        items: dropdownItems),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    selectedValue == 'Custom'
                        ? 'Custom Workouts can be set up later.'
                        : '',
                    style: const TextStyle(
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const LargeAppButton(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
