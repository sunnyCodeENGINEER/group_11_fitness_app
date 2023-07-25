import 'package:fitness_app/create_account_screen.dart';
import 'package:fitness_app/main%20app%20views/profile_screen.dart';
import 'package:fitness_app/models/database_connection.dart';
import 'package:fitness_app/models/typo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class EditInfoMobileScreen extends StatefulWidget {
  const EditInfoMobileScreen({super.key});

  @override
  State<EditInfoMobileScreen> createState() => _EditInfoMobileScreenState();
}

class _EditInfoMobileScreenState extends State<EditInfoMobileScreen> {
  String newLastname = "";
  String newFirstname = "";
  String newEmail = "";
  String newNumber = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          children: [
            const Row(
              children: [BackButton(), Expanded(child: SizedBox())],
            ),
            Text(
              "Enter your updated details below",
              style: largeTitlePurple,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: 'Enter your lastname.',
              ),
              onChanged: (value) {
                setState(() {
                  newLastname = value;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: 'Enter your firstname.',
              ),
              onChanged: (value) {
                setState(() {
                  newFirstname = value;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: 'enter your email address.',
              ),
              onChanged: (value) {
                setState(() {
                  newEmail = value;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: 'enter your phone number.',
              ),
              onChanged: (value) {
                setState(() {
                  newNumber = value;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            SubmitButton(
              newEmail: newEmail,
              newFirstname: newFirstname,
              newLastname: newLastname,
              newNumber: newNumber,
            )
          ],
        ),
      ),
    );
  }
}

class SubmitButton extends StatefulWidget {
  final String newLastname;
  final String newFirstname;
  final String newEmail;
  final String newNumber;

  const SubmitButton(
      {super.key,
      required this.newLastname,
      required this.newFirstname,
      required this.newEmail,
      required this.newNumber});

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  Future<bool> validateInputs() async {
    if (widget.newLastname.isEmpty ||
        widget.newFirstname.isEmpty ||
        widget.newEmail.isEmpty ||
        widget.newNumber.isEmpty) {
      print(widget.newLastname);
      // updateUser("username", "password", 0, 0, widget.newLastname,
      //     widget.newFirstname, widget.newEmail, widget.newNumber);
      // modelUser = await getUserData(modelUser.id) ?? modelUser;
      // showToastMessage("Please fill all forms provided above");
      return false;
    }

    updateUser("username", "password", 0, 0, widget.newLastname,
        widget.newFirstname, widget.newEmail, widget.newNumber);
    modelUser = await getUserData(modelUser.id) ?? modelUser;
    return true;
  }

  // String _name;
  String? _errorMessage;

  void _validateName(String value) {
    if (value.isEmpty) {
      setState(() {
        _errorMessage = "Name cannot be empty";
      });
    } else {
      setState(() {
        _errorMessage = null; // Clear the error message
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        bool response = await validateInputs();
        if (response) {
          Get.to(const ProfileScreen());
        }
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          minimumSize: const Size(12, 60)),
      child: const SizedBox(
          height: 50,
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.check_circle_outline_outlined),
              Text("SUBMIT")
            ],
          )),
    );
  }
}

void showErrorMessage(BuildContext context, String message) {
  final snackBar = SnackBar(content: Text(message));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

