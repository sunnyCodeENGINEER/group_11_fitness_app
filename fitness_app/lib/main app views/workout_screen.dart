import 'package:fitness_app/main%20app%20views/workout_timer_screen.dart';
import 'package:fitness_app/models/app_colors.dart';
import 'package:fitness_app/models/typo.dart';
import 'package:fitness_app/models/user_model.dart';
import 'package:fitness_app/models/workout_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkOutScreen extends StatefulWidget {
  const WorkOutScreen({super.key});

  @override
  State<WorkOutScreen> createState() => _WorkOutScreenState();
}

class _WorkOutScreenState extends State<WorkOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MediaQuery.of(context).size.width <=
              MediaQuery.of(context).size.height
          ? const WorkOutMobileScreen()
          : const WorkOutDesktopScreen(),
    );
  }
}

class WorkOutMobileScreen extends StatefulWidget {
  const WorkOutMobileScreen({super.key});

  @override
  State<WorkOutMobileScreen> createState() => _WorkOutMobileScreenState();
}

class _WorkOutMobileScreenState extends State<WorkOutMobileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
        decoration: BoxDecoration(color: primaryAppColor),
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 60, left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: Container(color: Colors.black),
                        ),
                        Text(
                          modelWorkout.name,
                          style: largeTitle,
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(10, 10),
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 20,
                                ),
                                BoxShadow(
                                  offset: const Offset(-2, -2),
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 10,
                                )
                              ]),
                          child: const Row(
                            children: [
                              Icon(Icons.timelapse_outlined),
                              SizedBox(
                                width: 5,
                              ),
                              Text('60 mins')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(10, 10),
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 20,
                          ),
                          BoxShadow(
                            offset: const Offset(-2, -2),
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 10,
                          )
                        ]),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              // alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 290,
              padding: const EdgeInsets.only(
                // top: 30,
                left: 10,
                right: 10,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      const BorderRadius.only(topLeft: Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(-5, -1),
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 30,
                    )
                  ]),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: exercisesInWorkout.length,
                      itemBuilder: (context, index) {
                        return MyListTile(
                          title: exercisesInWorkout[index].title,
                          reps: modelLevel.repsPerSet,
                          sets: int.parse(modelLevel.sets),
                          unit_1: 'Sets',
                          unit_2: 'Reps',
                          exercise: exercisesInWorkout[index],
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WorkOutDesktopScreen extends StatefulWidget {
  const WorkOutDesktopScreen({super.key});

  @override
  State<WorkOutDesktopScreen> createState() => _WorkOutDesktopScreenState();
}

class _WorkOutDesktopScreenState extends State<WorkOutDesktopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: primaryAppColor),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: Container(color: Colors.black),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.height * 0.4,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(10, 10),
                                      color: Colors.black.withOpacity(0.5),
                                      blurRadius: 20,
                                    ),
                                    BoxShadow(
                                      offset: const Offset(-2, -2),
                                      color: Colors.black.withOpacity(0.5),
                                      blurRadius: 10,
                                    )
                                  ]),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              modelWorkout.name,
                              style: largeTitleDesktop,
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(10, 10),
                                      color: Colors.black.withOpacity(0.5),
                                      blurRadius: 20,
                                    ),
                                    BoxShadow(
                                      offset: const Offset(-2, -2),
                                      color: Colors.black.withOpacity(0.5),
                                      blurRadius: 10,
                                    )
                                  ]),
                              child: const Row(
                                children: [
                                  Icon(Icons.timelapse_outlined),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('60 mins')
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Spacer()
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.only(
                top: 30,
                left: 10,
                right: 10,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      const BorderRadius.only(topLeft: Radius.circular(70)),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(-5, -1),
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 30,
                    )
                  ]),
              child: Expanded(
                child: ListView.builder(
                  itemCount: exercisesInWorkout.length,
                  itemBuilder: (context, index) {
                    return MyListTile(
                      title: exercisesInWorkout[index].title,
                      reps: modelLevel.repsPerSet,
                      sets: int.parse(modelLevel.sets),
                      unit_1: 'Sets',
                      unit_2: 'Reps',
                      exercise: exercisesInWorkout[index],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyListTile extends StatefulWidget {
  final String title;
  final String unit_1;
  final String unit_2;
  final String reps;
  final dynamic sets;
  final Exercise exercise;
  const MyListTile(
      {super.key,
      required this.title,
      required this.reps,
      required this.sets,
      required this.unit_1,
      required this.unit_2,
      required this.exercise});

  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(WorkOutTimerScreen(exercise: widget.exercise));
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
            color: tintPrimaryAppColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: shadowColor.withOpacity(0.7),
                offset: const Offset(5, 2),
                blurRadius: 10,
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: headerOnePrimaryColor,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(widget.unit_1),
                    Text(widget.reps.toString()),
                  ],
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  children: [
                    Text(widget.unit_2),
                    Text(widget.sets.toString()),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
