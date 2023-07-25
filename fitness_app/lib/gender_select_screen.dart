import 'package:fitness_app/age_select_view.dart';
import 'package:fitness_app/create_account_screen.dart';
import 'package:fitness_app/models/app_colors.dart';
import 'package:fitness_app/models/database_connection.dart';
import 'package:fitness_app/models/typo.dart';
import 'package:flutter/material.dart';

class GenderSelectScreen extends StatefulWidget {
  const GenderSelectScreen({super.key});

  @override
  State<GenderSelectScreen> createState() => _GenderSelectScreenState();
}

class _GenderSelectScreenState extends State<GenderSelectScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MediaQuery.of(context).size.width <=
              MediaQuery.of(context).size.height
          ? const GenderSelectMobileScreen()
          : const GenderSelectDesktopScreen(),
    );
  }
}

class GenderSelectMobileScreen extends StatefulWidget {
  const GenderSelectMobileScreen({super.key});

  @override
  State<GenderSelectMobileScreen> createState() =>
      _GenderSelectMobileScreenState();
}

class _GenderSelectMobileScreenState extends State<GenderSelectMobileScreen> {
  String userGender = '';

  void updateUserGender(String gender) {
    setState(() {
      userGender = gender;
    });
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
                  'Personalize Your Account',
                  style: headerOne,
                ),
                Text(
                  'What is your Gender?',
                  style: headerTwo,
                ),
              ],
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // GenderCard(
                //   icon: Icons.male,
                //   gender: 'Male',
                //   userGender: userGender,
                //   color: userGender == 'Male' ? primaryAppColor : Colors.white,
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                // GenderCard(
                //   icon: Icons.female,
                //   gender: 'Female',
                //   userGender: userGender,
                //   color:
                //       userGender == 'Female' ? primaryAppColor : Colors.white,
                // ),
                InkWell(
                  onTap: () {
                    updateUserGender("Male");
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(width: 3),
                      borderRadius: BorderRadius.circular(10),
                      color:
                          userGender == "Male" ? primaryAppColor : Colors.white,
                    ),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.male_rounded,
                          size: 100,
                        ),
                        Text(
                          "Male",
                          style: headerOne,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    updateUserGender("Female");
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(width: 3),
                      borderRadius: BorderRadius.circular(10),
                      color: userGender == "Female"
                          ? primaryAppColor
                          : Colors.white,
                    ),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.female_rounded,
                          size: 100,
                        ),
                        Text(
                          "Female",
                          style: headerOne,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const LargeAppButton(
              screen: AgeSelectScreen(),
            ),
          ],
        )),
      ),
    );
  }
}

class GenderSelectDesktopScreen extends StatefulWidget {
  const GenderSelectDesktopScreen({super.key});

  @override
  State<GenderSelectDesktopScreen> createState() =>
      _GenderSelectDesktopScreenState();
}

class _GenderSelectDesktopScreenState extends State<GenderSelectDesktopScreen> {
  String userGender = '';

  void updateUserGender(String gender) {
    setState(() {
      userGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                'What is your Gender?',
                style: headerTwo,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // GenderCard(
                  //   icon: Icons.male,
                  //   gender: 'Male',
                  //   iconSize: MediaQuery.of(context).size.width * 0.25,
                  //   userGender: userGender,
                  //   color:
                  //       userGender == 'Male' ? primaryAppColor : Colors.white,
                  // ),
                  // const SizedBox(
                  //   width: 20,
                  // ),
                  // GenderCard(
                  //   icon: Icons.female,
                  //   gender: 'Female',
                  //   iconSize: MediaQuery.of(context).size.width * 0.25,
                  //   userGender: userGender,
                  //   color:
                  //       userGender == 'Female' ? primaryAppColor : Colors.white,
                  // ),
                  InkWell(
                    onTap: () {
                      updateUserGender("Male");
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(width: 3),
                        borderRadius: BorderRadius.circular(10),
                        color: userGender == "Male"
                            ? primaryAppColor
                            : Colors.white,
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.male_rounded,
                            size: 100,
                          ),
                          Text(
                            "Male",
                            style: headerOne,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      updateUserGender("Female");
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(width: 3),
                        borderRadius: BorderRadius.circular(10),
                        color: userGender == "Female"
                            ? primaryAppColor
                            : Colors.white,
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.female_rounded,
                            size: 100,
                          ),
                          Text(
                            "Female",
                            style: headerOne,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          const LargeAppButton(
            screen: AgeSelectScreen(),
          ),
        ],
      )),
    );
  }
}

class GenderCard extends StatefulWidget {
  String userGender;
  final IconData icon;
  final String gender;
  final double iconSize;
  Color color;
  GenderCard(
      {super.key,
      required this.icon,
      required this.gender,
      this.iconSize = 100,
      required this.userGender,
      required this.color});

  @override
  State<GenderCard> createState() => _GenderCardState();
}

class _GenderCardState extends State<GenderCard> {
  bool male = false;
  static String userGender = '';

  void genderSelect() {
    setState(() {
      userGender = widget.gender;
      print(widget.userGender);
      runDatabaseQuery();
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: genderSelect,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(width: 3),
          borderRadius: BorderRadius.circular(10),
          color: userGender == widget.gender ? primaryAppColor : Colors.white,
        ),
        child: Column(
          children: [
            Icon(
              widget.icon,
              size: widget.iconSize,
            ),
            Text(
              widget.gender,
              style: headerOne,
            )
          ],
        ),
      ),
    );
  }
}
