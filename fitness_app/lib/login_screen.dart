import 'package:fitness_app/create_account_screen.dart';
import 'package:fitness_app/main%20app%20views/home_screen.dart';
import 'package:fitness_app/models/database_connection.dart';
import 'package:fitness_app/models/nutrition_model.dart';
import 'package:fitness_app/models/typo.dart';
import 'package:fitness_app/models/user_model.dart';
import 'package:fitness_app/models/workout_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MediaQuery.of(context).size.width <=
              MediaQuery.of(context).size.height
          ? const LoginMobileScreen()
          : const LoginDesktopScreen(),
    );
  }
}

class LoginMobileScreen extends StatefulWidget {
  const LoginMobileScreen({super.key});

  @override
  State<LoginMobileScreen> createState() => _LoginMobileScreenState();
}

class _LoginMobileScreenState extends State<LoginMobileScreen> {
  bool rememberMe = false;
  bool signIn = false;

  void _signIn() {
    setState(() {
      signIn = !signIn;
      Get.to(const CreateAccountScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.06,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                width: 300,
                decoration: const BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Log In To Your\nAccount",
                    style: largeTitle,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: 'Enter your Username.',
                        ),
                        onChanged: (value) {
                          userDetails.username = value;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: 'Enter your password.',
                        ),
                        onChanged: (value) {
                          userDetails.password = value;
                        },
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                            value: rememberMe,
                            onChanged: (bool? value) {
                              setState(() {
                                rememberMe = value!;
                              });
                            }),
                        const Text('Remember Me'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: _signIn,
                            child: const Text('Forgot your password?'))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Center(
            child: Column(
              children: [
                const LargeAppButtonLogin(
                  screen: HomeScreen(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Are you a new user?'),
                      TextButton(
                          onPressed: _signIn, child: const Text('Sign Up'))
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class LoginDesktopScreen extends StatefulWidget {
  const LoginDesktopScreen({super.key});

  @override
  State<LoginDesktopScreen> createState() => _LoginDesktopScreenState();
}

class _LoginDesktopScreenState extends State<LoginDesktopScreen> {
  bool rememberMe = false;
  bool signIn = false;

  void _signIn() {
    setState(() {
      signIn = !signIn;
      Get.to(const CreateAccountScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(
        top: 70,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(
              bottom: 50,
            ),
            height: 400,
            width: MediaQuery.of(context).size.width * 0.4,
            decoration: const BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(400),
                bottomRight: Radius.circular(400),
              ),
            ),
            child: Center(
              child: Text(
                "Log In To Your\nAccount",
                style: largeTitleDesktop,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.08),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: 'Enter your Username.',
                          ),
                          onChanged: (value) {
                            userDetails.username = value;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: 'Enter your password.',
                          ),
                          onChanged: (value) {
                            userDetails.password = value;
                          },
                          obscureText: true,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                              value: rememberMe,
                              onChanged: (bool? value) {
                                setState(() {
                                  rememberMe = value!;
                                });
                              }),
                          const Text('Remember Me'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: _signIn,
                              child: const Text('Forgot your password?'))
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const LargeAppButtonLogin(
                        screen: HomeScreen(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Are you a new user?'),
                          TextButton(
                              onPressed: _signIn, child: const Text('Sign Up'))
                        ],
                      ),
                    ],
                  )
                  // const Spacer(),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}

Future<void> _validate(String username, String password) async {
  int userID = await validateLogin(username, password) ?? 0;

  modelUser = await getUserData(userID) ??
      User(1, 'Doe', 'John', 'Male', 28, 'jogndoe@you.us', '0200000000');
}

void login() {
  _validate(userDetails.username, userDetails.password);
}

class LargeAppButtonLogin extends StatefulWidget {
  final Widget screen;

  const LargeAppButtonLogin({super.key, required this.screen});

  @override
  State<LargeAppButtonLogin> createState() => _LargeAppButtonLoginState();
}

class _LargeAppButtonLoginState extends State<LargeAppButtonLogin> {
  Future<void> _navigate() async {
    int? userID =
        await validateLogin(userDetails.username, userDetails.password);
    if (userID != null) {
      modelUser = await getUserData(userID) ?? modelUser;
      userDetails.splitID = await getSplitID(userID) ?? 0;
      modelPlan.id = await getMealPlanID(userID) ?? 0;
      modelPlan = await getMealPlan(modelPlan.id) ?? modelPlan;
      modelSplit = await getSplit(userDetails.splitID) ?? modelSplit;
      weeklyWorkouts = [];
      if (modelSplit.name != "name") {
        weeklyWorkouts.add(await getWorkout(modelSplit.monday) ?? modelWorkout);
        weeklyWorkouts
            .add(await getWorkout(modelSplit.tuesday) ?? modelWorkout);
        weeklyWorkouts
            .add(await getWorkout(modelSplit.wednesday) ?? modelWorkout);
        weeklyWorkouts
            .add(await getWorkout(modelSplit.thursday) ?? modelWorkout);
        weeklyWorkouts.add(await getWorkout(modelSplit.friday) ?? modelWorkout);
        weeklyWorkouts
            .add(await getWorkout(modelSplit.saturday) ?? modelWorkout);
        weeklyWorkouts.add(await getWorkout(modelSplit.sunday) ?? modelWorkout);
      }
      dailyFood = [];
      if (modelPlan.name != "name") {
        dailyFood.add(await getFood(modelPlan.breakfast) ?? modelFood);
        dailyFood.add(await getFood(modelPlan.lunch) ?? modelFood);
        dailyFood.add(await getFood(modelPlan.dinner) ?? modelFood);
      }
      modelWeightGoal = await getWeightGoal(userID) ?? modelWeightGoal;
      modelLevel = await getUserLevel(userID) ?? modelLevel;
      Get.to(widget.screen);
    }
    // for (var i in weeklyWorkouts) {
    // }
    // for (var i in dailyFood) {
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 50,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            minimumSize: const Size(200, 60)),
        onPressed: _navigate,
        child: const Text("NEXT"),
      ),
    );
  }
}

String? _validateInput(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your username.';
  }
  return null;
}
