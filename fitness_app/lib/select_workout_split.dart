import 'dart:ffi';

import 'package:fitness_app/create_account_screen.dart';
import 'package:fitness_app/models/typo.dart';
import 'package:fitness_app/models/user_model.dart';
import 'package:fitness_app/select_meal_plan.dart';
import 'package:flutter/material.dart';

class SelectWorkoutSplitScreen extends StatefulWidget {
  const SelectWorkoutSplitScreen({super.key});

  @override
  State<SelectWorkoutSplitScreen> createState() =>
      _SelectWorkoutSplitScreenState();
}

class _SelectWorkoutSplitScreenState extends State<SelectWorkoutSplitScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MediaQuery.of(context).size.width <=
              MediaQuery.of(context).size.height
          ? const SelectWorkoutSplitMobileScreen()
          : const SelectWorkoutSplitDesktopScreen(),
    );
  }
}

class SelectWorkoutSplitMobileScreen extends StatefulWidget {
  const SelectWorkoutSplitMobileScreen({super.key});

  @override
  State<SelectWorkoutSplitMobileScreen> createState() =>
      _SelectWorkoutSplitMobileScreenState();
}

class _SelectWorkoutSplitMobileScreenState
    extends State<SelectWorkoutSplitMobileScreen> {
  String selectedValue = '2';

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(value: "2", child: Text("Push Pull Legs")),
      DropdownMenuItem(value: "1", child: Text("Upper Lower Split")),
      DropdownMenuItem(value: "3", child: Text("Full Body")),
      DropdownMenuItem(value: "0", child: Text("Custom")),
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
                    'Choose your Workout Plan',
                    style: headerOne,
                  ),
                  Text(
                    'What is your current exercise level?',
                    style: headerTwo,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MediumAppButton(level: 'Beginner'),
                      SizedBox(
                        width: 5,
                      ),
                      MediumAppButton(
                        level: 'Intermediate',
                        width: 120,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      MediumAppButton(level: 'Advanced'),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  Text(
                    'Choose a split',
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
                            userDetails.splitID = int.parse(selectedValue);
                          });
                        },
                        items: dropdownItems),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    selectedValue == '0'
                        ? 'Custom Workouts can be set up later.'
                        : '',
                    style: const TextStyle(
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const LargeAppButton(
                    screen: SelectMealPlanScreen(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SelectWorkoutSplitDesktopScreen extends StatefulWidget {
  const SelectWorkoutSplitDesktopScreen({super.key});

  @override
  State<SelectWorkoutSplitDesktopScreen> createState() =>
      _SelectWorkoutSplitDesktopScreenState();
}

class _SelectWorkoutSplitDesktopScreenState
    extends State<SelectWorkoutSplitDesktopScreen> {
  String selectedValue = '2';

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(value: "2", child: Text("Push Pull Legs")),
      DropdownMenuItem(value: "1", child: Text("Upper Lower Split")),
      DropdownMenuItem(value: "3", child: Text("Full Body")),
      DropdownMenuItem(value: "0", child: Text("Custom")),
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
                    'Choose your Workout Plan',
                    style: headerOne,
                  ),
                  Text(
                    'What is your current exercise level?',
                    style: headerTwo,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MediumAppButton(
                        level: 'Beginner',
                        width: 150,
                        height: 60,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      MediumAppButton(
                        level: 'Intermediate',
                        width: 150,
                        height: 60,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      MediumAppButton(
                        level: 'Advanced',
                        width: 150,
                        height: 60,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  Text(
                    'Choose a split',
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
                            userDetails.splitID = int.parse(selectedValue);
                          });
                        },
                        items: dropdownItems),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    selectedValue == '0'
                        ? 'Custom Workouts can be set up later.'
                        : '',
                    style: const TextStyle(
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const LargeAppButton(
                    screen: SelectMealPlanScreen(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MediumAppButton extends StatefulWidget {
  final String level;
  final double width;
  final double height;
  const MediumAppButton({
    super.key,
    required this.level,
    this.height = 40,
    this.width = 100,
  });

  @override
  State<MediumAppButton> createState() => _MediumAppButtonState();
}

class _MediumAppButtonState extends State<MediumAppButton> {
  void _setLevel() {
    setState(() {
      switch (widget.level) {
        case "Beginner":
          userDetails.levelID = 2;
          break;
        case "Intermediate":
          userDetails.levelID = 3;
          break;
        case "Advanced":
          userDetails.levelID = 4;
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 50,
      ),
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: _setLevel,
          child: Text(
            widget.level,
            style: mediumButtonText,
          ),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     padding: const EdgeInsets.only(
  //       bottom: 50,
  //     ),
  //     child: ElevatedButton(
  //       style: ElevatedButton.styleFrom(
  //         backgroundColor: Colors.purple,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(30),
  //         ),
  //         // minimumSize: Size(widget.width, widget.height),
  //       ),
  //       onPressed: _setLevel,
  //       child: Text(
  //         widget.level,
  //         style: mediumButtonText,
  //       ),
  //     ),
  //   );
  // }
}
