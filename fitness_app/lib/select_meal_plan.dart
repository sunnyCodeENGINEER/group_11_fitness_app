import 'package:fitness_app/create_account_screen.dart';
import 'package:fitness_app/fill_profile_screen.dart';
import 'package:fitness_app/models/nutrition_model.dart';
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
  String selectedValue = '1';

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(value: "1", child: Text("Sample Meal Plan")),
      // DropdownMenuItem(value: "Carnivorous", child: Text("Carnivorous")),
      // DropdownMenuItem(value: "Vegetarian", child: Text("Vegetarian")),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // MediumAppButtonPlan(level: 'Lose Weight'),
                      // SizedBox(
                      //   width: 5,
                      // ),
                      // MediumAppButtonPlan(level: 'Maintain Weight'),
                      // SizedBox(
                      //   width: 5,
                      // ),
                      // MediumAppButtonPlan(level: 'Gain Weight'),
                      // SizedBox(
                      //   width: 5,
                      // ),
                      Container(
                        padding: const EdgeInsets.only(
                          bottom: 50,
                        ),
                        child: SizedBox(
                          width: 100,
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple
                                  .withOpacity(modelWeightGoal.id == 3 ? 1 : 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                modelWeightGoal.id = 3;
                              });
                            },
                            child: Text(
                              "Loose Weight",
                              style: mediumButtonText,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          bottom: 50,
                        ),
                        child: SizedBox(
                          width: 120,
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple
                                  .withOpacity(modelWeightGoal.id == 2 ? 1 : 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                modelWeightGoal.id = 2;
                              });
                            },
                            child: Text(
                              "Maintain Weight",
                              style: mediumButtonText,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          bottom: 50,
                        ),
                        child: SizedBox(
                          width: 100,
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple
                                  .withOpacity(modelWeightGoal.id == 1 ? 1 : 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                modelWeightGoal.id = 1;
                              });
                            },
                            child: Text(
                              "Gain Weight",
                              style: mediumButtonText,
                            ),
                          ),
                        ),
                      )
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
                            modelPlan.id = int.parse(newValue);
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
                  const LargeAppButton(
                    screen: FillProfileScreen(),
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

class SelectMealPlanDesktopScreen extends StatefulWidget {
  const SelectMealPlanDesktopScreen({super.key});

  @override
  State<SelectMealPlanDesktopScreen> createState() =>
      _SelectMealPlanDesktopScreenState();
}

class _SelectMealPlanDesktopScreenState
    extends State<SelectMealPlanDesktopScreen> {
  String selectedValue = '0';

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(value: "1", child: Text("Sample Meal Plan")),
      // DropdownMenuItem(value: "Carnivorous", child: Text("Carnivorous")),
      // DropdownMenuItem(value: "Vegetarian", child: Text("Vegetarian")),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // MediumAppButtonPlan(
                      //   level: 'Lose Weight',
                      //   width: 150,
                      //   height: 60,
                      // ),
                      // SizedBox(
                      //   width: 5,
                      // ),
                      // MediumAppButtonPlan(
                      //   level: 'Maintain Weight',
                      //   width: 150,
                      //   height: 60,
                      // ),
                      // SizedBox(
                      //   width: 5,
                      // ),
                      // MediumAppButtonPlan(
                      //   level: 'Gain Weight',
                      //   width: 150,
                      //   height: 60,
                      // ),
                      // SizedBox(
                      //   width: 5,
                      // ),
                      Container(
                        padding: const EdgeInsets.only(
                          bottom: 50,
                        ),
                        child: SizedBox(
                          width: 100,
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple
                                  .withOpacity(modelWeightGoal.id == 3 ? 1 : 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                modelWeightGoal.id = 3;
                              });
                            },
                            child: Text(
                              "Loose Weight",
                              style: mediumButtonText,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          bottom: 50,
                        ),
                        child: SizedBox(
                          width: 120,
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple
                                  .withOpacity(modelWeightGoal.id == 2 ? 1 : 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                modelWeightGoal.id = 2;
                              });
                            },
                            child: Text(
                              "Maintain Weight",
                              style: mediumButtonText,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          bottom: 50,
                        ),
                        child: SizedBox(
                          width: 100,
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple
                                  .withOpacity(modelWeightGoal.id == 1 ? 1 : 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                modelWeightGoal.id = 1;
                              });
                            },
                            child: Text(
                              "Gain Weight",
                              style: mediumButtonText,
                            ),
                          ),
                        ),
                      )
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
                            modelPlan.id = int.parse(newValue);
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
                  const LargeAppButton(
                    screen: FillProfileScreen(),
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

class MediumAppButtonPlan extends StatefulWidget {
  final String level;
  final double width;
  final double height;
  const MediumAppButtonPlan({
    super.key,
    required this.level,
    this.height = 40,
    this.width = 100,
  });

  @override
  State<MediumAppButtonPlan> createState() => _MediumAppButtonPlanState();
}

class _MediumAppButtonPlanState extends State<MediumAppButtonPlan> {
  void _setLevel() {
    setState(() {
      switch (widget.level) {
        case "Lose Weight":
          modelWeightGoal.id = 3;
          break;
        case "Maintain Weight":
          modelWeightGoal.id = 2;
          break;
        case "Gain Weight":
          modelWeightGoal.id = 1;
          break;
        default:
      }
      print(modelWeightGoal.id);
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
}
