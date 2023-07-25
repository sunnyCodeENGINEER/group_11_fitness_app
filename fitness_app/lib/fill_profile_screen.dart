import 'package:fitness_app/create_account_screen.dart';
import 'package:fitness_app/login_screen.dart';
import 'package:fitness_app/models/database_connection.dart';
import 'package:fitness_app/models/typo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'models/user_model.dart';

class FillProfileScreen extends StatefulWidget {
  const FillProfileScreen({super.key});

  @override
  State<FillProfileScreen> createState() => _FillProfileScreenState();
}

class _FillProfileScreenState extends State<FillProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MediaQuery.of(context).size.width <=
              MediaQuery.of(context).size.height
          ? const FillProfileMobileScreen()
          : const FillProfileDesktopScreen(),
    );
  }
}

class FillProfileMobileScreen extends StatefulWidget {
  const FillProfileMobileScreen({super.key});

  @override
  State<FillProfileMobileScreen> createState() =>
      _FillProfileMobileScreenState();
}

class _FillProfileMobileScreenState extends State<FillProfileMobileScreen> {
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
                    "Fill in Your\nDetails",
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
                          labelText: 'Enter your firstname.',
                        ),
                        onChanged: (value) {
                          modelUser.firstname = value;
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
                          labelText: 'Enter your lastname.',
                        ),
                        onChanged: (value) {
                          modelUser.lastname = value;
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
                          labelText: 'Enter your Email.',
                        ),
                        onChanged: (value) {
                          modelUser.email = value;
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const Center(
            child: LargeAppButtonCreate(
              screen: LoginScreen(),
              myfunction: createAccount,
            ),
          )
        ],
      ),
    ));
  }
}

class FillProfileDesktopScreen extends StatefulWidget {
  const FillProfileDesktopScreen({super.key});

  @override
  State<FillProfileDesktopScreen> createState() =>
      _FillProfileDesktopScreenState();
}

class _FillProfileDesktopScreenState extends State<FillProfileDesktopScreen> {
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
                "Fill in Your\nDetails",
                style: largeTitleDesktop,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * 0.08,
            ),
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
                            labelText: 'Enter your firstname.',
                          ),
                          onChanged: (value) {
                            modelUser.firstname = value;
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
                            labelText: 'Enter your lastname.',
                          ),
                          onChanged: (value) {
                            modelUser.lastname = value;
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
                            labelText: 'Enter your Email.',
                          ),
                          onChanged: (value) {
                            modelUser.email = value;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                  const LargeAppButtonCreate(
                    screen: LoginScreen(),
                    myfunction: createAccount,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}

void addAccount(
    String username, String password, int levelID, int splitID, User user) {
  addUser(username, password, levelID, splitID, user.toList());
}

void createAccount() {
  addAccount(userDetails.username, userDetails.password, userDetails.levelID,
      userDetails.splitID, userDetails.user);
  print("Successful");
}

class LargeAppButtonCreate extends StatefulWidget {
  final Widget screen;
  final VoidCallback? myfunction;

  const LargeAppButtonCreate(
      {super.key, required this.screen, this.myfunction});

  @override
  State<LargeAppButtonCreate> createState() => _LargeAppButtonCreateState();
}

class _LargeAppButtonCreateState extends State<LargeAppButtonCreate> {
  int a = 0;

  void _navigate() {
    addUser(userDetails.username, userDetails.password, userDetails.levelID,
        userDetails.splitID, userDetails.user.toList());
    // runDatabaseQuery();
    //  createAccount();
    print(modelUser.email);
    print(modelUser.firstname);
    print(modelUser.lastname);
    print(modelUser.phoneNumber);
    print(modelUser.gender);
    print(userDetails.username);
    print(userDetails.password);
    print(userDetails.user.toList());
    print("successful");
    Get.to(widget.screen);
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
        child: const Text("NEXT!"),
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
