import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MediaQuery.of(context).size.width <=
              MediaQuery.of(context).size.height
          ? const OnBoardingScreenMobile()
          : const OnBoardingScreenDesktop(),
    );
  }
}

class OnBoardingScreenDesktop extends StatefulWidget {
  const OnBoardingScreenDesktop({super.key});

  @override
  State<OnBoardingScreenDesktop> createState() =>
      _OnBoardingScreenDesktopState();
}

class _OnBoardingScreenDesktopState extends State<OnBoardingScreenDesktop> {
  int a = 0;

  void _incrementCounter() {
    if (a < 1) {
      setState(() {
        a++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Text(
                    "Workouts\nTailored to\nyour needs.",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                    softWrap: false,
                    maxLines: 5,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.only(
              bottom: 50,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: const Size(200, 80)),
              onPressed: _incrementCounter,
              child: Text("$a"),
            ),
          )
        ],
      ),
    );
  }
}

class OnBoardingScreenMobile extends StatefulWidget {
  const OnBoardingScreenMobile({super.key});

  @override
  State<OnBoardingScreenMobile> createState() => _OnBoardingScreenMobileState();
}

class _OnBoardingScreenMobileState extends State<OnBoardingScreenMobile> {
  int a = 0;

  void _incrementCounter() {
    if (a < 1) {
      setState(() {
        a++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.centerEnd,
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const OnBoardingScreenMobileColumn(
              text: "Workouts Tailored \nto your needs.",
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.8, 50)),
              onPressed: _incrementCounter,
              child: Text("$a"),
            ),
          ],
        ),
      ),
    );
  }
}

class OnBoardingScreenMobileColumn extends StatefulWidget {
  final String text;
  const OnBoardingScreenMobileColumn({super.key, required this.text});

  @override
  State<OnBoardingScreenMobileColumn> createState() =>
      _OnBoardingScreenMobileColumnState();
}

class _OnBoardingScreenMobileColumnState
    extends State<OnBoardingScreenMobileColumn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.5,
          padding: EdgeInsets.only(
            top: 60,
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.purple,
              boxShadow: const [
                BoxShadow(
                  offset: Offset(5, 5),
                  blurRadius: 50,
                ),
              ]),
        ),
        const SizedBox(
          height: 50,
        ),
        Text(
          widget.text,
          softWrap: false,
          maxLines: 5,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
