import 'package:fitness_app/create_account_screen.dart';
import 'package:fitness_app/models/typo.dart';
import 'package:fitness_app/models/user_model.dart';
import 'package:fitness_app/select_workout_split.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class AgeSelectScreen extends StatefulWidget {
  const AgeSelectScreen({super.key});

  @override
  State<AgeSelectScreen> createState() => _AgeSelectScreenState();
}

class _AgeSelectScreenState extends State<AgeSelectScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MediaQuery.of(context).size.width <=
              MediaQuery.of(context).size.height
          ? const AgeSelectMobileScreen()
          : const AgeSelectDesktopScreen(),
    );
  }
}

class AgeSelectMobileScreen extends StatefulWidget {
  const AgeSelectMobileScreen({super.key});

  @override
  State<AgeSelectMobileScreen> createState() => _AgeSelectMobileScreenState();
}

class _AgeSelectMobileScreenState extends State<AgeSelectMobileScreen> {
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'Personalize Your Account',
                    style: headerOne,
                  ),
                  Text(
                    'What is your age in years',
                    style: headerTwo,
                  )
                ],
              ),
              NumberPicker(
                axis: Axis.horizontal,
                minValue: 1,
                maxValue: 100,
                value: modelUser.age,
                onChanged: ((value) {
                  setState(() {
                    age = value;
                  });
                }),
                itemHeight: 100,
                textStyle: headerTwo,
                selectedTextStyle: pickerText,
                haptics: true,
              ),
              const LargeAppButton(screen: SelectWorkoutSplitScreen(),)
            ],
          ),
        ),
      ),
    );
  }
}

class AgeSelectDesktopScreen extends StatefulWidget {
  const AgeSelectDesktopScreen({super.key});

  @override
  State<AgeSelectDesktopScreen> createState() => _AgeSelectDesktopScreenState();
}

class _AgeSelectDesktopScreenState extends State<AgeSelectDesktopScreen> {
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'Personalize Your Account',
                    style: headerOne,
                  ),
                  Text(
                    'What is your age in years',
                    style: headerTwo,
                  )
                ],
              ),
              NumberPicker(
                axis: Axis.horizontal,
                itemCount: 7,
                minValue: 1,
                maxValue: 100,
                value: modelUser.age,
                onChanged: ((value) {
                  setState(() {
                    age = value;
                  });
                }),
                itemHeight: 150,
                textStyle: headerTwo,
                selectedTextStyle: pickerTextDesktop,
              ),
              const LargeAppButton(screen: SelectWorkoutSplitScreen(),)
            ],
          ),
        ),
      ),
    );
  }
}

class AgeCard extends StatefulWidget {
  final int age;
  const AgeCard({super.key, required this.age});

  @override
  State<AgeCard> createState() => _AgeCardState();
}

class _AgeCardState extends State<AgeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(width: 3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(widget.age.toString()),
    );
  }
}
