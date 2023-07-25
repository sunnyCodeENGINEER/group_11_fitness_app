import 'package:fitness_app/create_account_screen.dart';
import 'package:flutter/material.dart';
// Import the screen you want to navigate to after the splash screen
// import 'package:my_app/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  // Define the duration for which the splash screen will be shown
  final splashDuration = const Duration(seconds: 3);

  // Navigate to the home screen after the splash duration
  void navigateToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => const CreateAccountScreen(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    // Start the timer to navigate to the home screen
    Future.delayed(splashDuration, navigateToHome);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // You can customize the splash screen design here
      body: Center(
        child: FlutterLogo(
          size: 150,
        ),
      ),
    );
  }
}
