import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
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
          Column(
            children: [
              Row(
                children: const [
                  Expanded(
                    child: OnBoardingScreenColumn(
                      text: "Workouts Tailored to your needs.",
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.8, 40)),
                onPressed: _incrementCounter,
                child: Text("$a"),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class OnBoardingScreenColumn extends StatefulWidget {
  final String text;
  const OnBoardingScreenColumn({super.key, required this.text});

  @override
  State<OnBoardingScreenColumn> createState() => _OnBoardingScreenColumnState();
}

class _OnBoardingScreenColumnState extends State<OnBoardingScreenColumn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.width * 0.8,
          width: MediaQuery.of(context).size.width * 0.8,
          margin: EdgeInsets.only(
              top: 60,
              left: MediaQuery.of(context).size.width * 0.1,
              right: MediaQuery.of(context).size.width * 0.1),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.purple),
        ),
        const SizedBox(
          height: 100,
        ),
        Text(
          widget.text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 100,
        ),
      ],
    );
  }
}
