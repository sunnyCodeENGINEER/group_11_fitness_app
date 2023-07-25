import 'package:fitness_app/create_account_screen.dart';
import 'package:fitness_app/main%20app%20views/edit_info_screen.dart';
import 'package:fitness_app/models/typo.dart';
import 'package:fitness_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MediaQuery.of(context).size.width <=
              MediaQuery.of(context).size.height
          ? const ProfileMobileScreen()
          : const ProfileMobileScreen(),
    );
  }
}

class ProfileMobileScreen extends StatefulWidget {
  const ProfileMobileScreen({super.key});

  @override
  State<ProfileMobileScreen> createState() => _ProfileMobileScreenState();
}

class _ProfileMobileScreenState extends State<ProfileMobileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(children: [
          const Row(
            children: [BackButton(), Expanded(child: SizedBox())],
          ),
          const SizedBox(
            height: 100,
          ),
          Row(
            children: [
              Text(
                "Last Name: ",
                style: subheading,
              ),
              Text(modelUser.lastname),
            ],
          ),
          Row(
            children: [
              Text(
                "First Name: ",
                style: subheading,
              ),
              Text(modelUser.firstname),
            ],
          ),
          Row(
            children: [
              Text(
                "E-Mail: ",
                style: subheading,
              ),
              Text(modelUser.email),
            ],
          ),
          Row(
            children: [
              Text(
                "Phone Number: ",
                style: subheading,
              ),
              Text(modelUser.phoneNumber),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const EditInfoButton(),
          const SizedBox(
            height: 60,
          ),
          const LogoutButton()
        ]),
      ),
    );
  }
}

class LogoutButton extends StatefulWidget {
  const LogoutButton({super.key});

  @override
  State<LogoutButton> createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Get.to(const CreateAccountScreen());
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          minimumSize: const Size(200, 60)),
      child: const SizedBox(
          height: 50,
          width: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Icon(Icons.person_remove_alt_1_rounded), Text("LOGOUT")],
          )),
    );
  }
}

class EditInfoButton extends StatefulWidget {
  const EditInfoButton({super.key});

  @override
  State<EditInfoButton> createState() => _EditInfoButtonState();
}

class _EditInfoButtonState extends State<EditInfoButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Get.to(EditInfoMobileScreen());
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
            children: [Icon(Icons.edit_calendar), Text("EDIT")],
          )),
    );
  }
}
