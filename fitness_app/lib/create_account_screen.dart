import 'package:fitness_app/gender_select_screen.dart';
import 'package:fitness_app/login_screen.dart';
import 'package:fitness_app/models/database_connection.dart';
import 'package:fitness_app/models/typo.dart';
import 'package:fitness_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MediaQuery.of(context).size.width <=
              MediaQuery.of(context).size.height
          ? const CreateAccountMobileScreen()
          : const CreateAccountDesktopScreen(),
    );
  }
}

class CreateAccountMobileScreen extends StatefulWidget {
  const CreateAccountMobileScreen({super.key});

  @override
  State<CreateAccountMobileScreen> createState() =>
      _CreateAccountMobileScreenState();
}

class _CreateAccountMobileScreenState extends State<CreateAccountMobileScreen> {
  bool rememberMe = false;
  bool signIn = false;
  String _username = "";
  String _password = "";
  String _confirmPassword = "";

  void _signIn() {
    setState(() {
      signIn = !signIn;
      Get.to(const LoginScreen());
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
                    "Create Your\nAccount",
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
                          setState(() {
                            userDetails.username = value;
                          });
                        },
                        validator: _validateInput,
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
                          setState(() {
                            userDetails.password = value;
                          });
                        },
                        validator: _validateInput,
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
                          labelText: 'Confirm your password.',
                        ),
                        onChanged: (value) {
                          setState(() {
                            _confirmPassword = value;
                          });
                        },
                        validator: _validateInput,
                      ),
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
                  ],
                ),
              ),
            ],
          ),
          Center(
            child: Column(
              children: [
                const LargeAppButton(
                  screen: GenderSelectScreen(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?'),
                      TextButton(
                          onPressed: _signIn, child: const Text('Sign In'))
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

class CreateAccountDesktopScreen extends StatefulWidget {
  const CreateAccountDesktopScreen({super.key});

  @override
  State<CreateAccountDesktopScreen> createState() =>
      _CreateAccountDesktopScreenState();
}

class _CreateAccountDesktopScreenState
    extends State<CreateAccountDesktopScreen> {
  bool rememberMe = false;
  bool signIn = false;
  String _username = "";
  String _password = "";
  String _confirmPassword = "";

  void _signIn() {
    setState(() {
      signIn = !signIn;
      Get.to(const LoginScreen());
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
                "Create Your\nAccount",
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
                            setState(() {
                              userDetails.username = value;
                            });
                          },
                          validator: _validateInput,
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
                            setState(() {
                              userDetails.password = value;
                            });
                          },
                          validator: _validateInput,
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
                            labelText: 'Confirm your password.',
                          ),
                          onChanged: (value) {
                            setState(() {
                              _confirmPassword = value;
                            });
                          },
                          validator: _validateInput,
                        ),
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
                      const SizedBox(
                        height: 15,
                      ),
                      const LargeAppButton(
                        screen: GenderSelectScreen(),
                      ),
                      // const SizedBox(
                      //   height: 15,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have an account?'),
                          TextButton(
                              onPressed: _signIn, child: const Text('Sign In'))
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

class LargeAppButton extends StatefulWidget {
  final Widget screen;
  final VoidCallback? myfunction;

  const LargeAppButton(
      {super.key, required this.screen, this.myfunction});

  @override
  State<LargeAppButton> createState() => _LargeAppButtonState();
}

class _LargeAppButtonState extends State<LargeAppButton> {
  int a = 0;

  void _incrementCounter() {
    if (a < 1) {
      setState(() {
        a++;
      });
    }
  }

  void _navigate() {
    widget.myfunction;
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