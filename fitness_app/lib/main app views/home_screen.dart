import 'package:fitness_app/main%20app%20views/workout_screen.dart';
import 'package:fitness_app/models/app_banner_model.dart';
import 'package:fitness_app/models/database_connection.dart';
import 'package:fitness_app/models/typo.dart';
import 'package:fitness_app/models/user_model.dart';
import 'package:fitness_app/models/workout_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MediaQuery.of(context).size.width <=
              MediaQuery.of(context).size.height
          ? const HomeMobileScreen()
          : const HomeMobileScreen(),
    );
  }
}

class HomeMobileScreen extends StatefulWidget {
  const HomeMobileScreen({super.key});

  @override
  State<HomeMobileScreen> createState() => _HomeMobileScreenState();
}

class _HomeMobileScreenState extends State<HomeMobileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Good Morning ',
                    style: headerOne,
                  ),
                  Text(
                    modelUser.lastname.toUpperCase(),
                    style: largeTitleBlack,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Upcoming workouts',
                style: subheadingBlack,
              ),
            ),
            AppBanner(list: weeklyWorkouts),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Upcoming meals',
                style: subheadingBlack,
              ),
            ),
            AppBanner(list: mealBannerList)
          ],
        ),
      ),
    );
  }
}

class AppBanner extends StatefulWidget {
  final List list;
  // final  _selectedIndex = 0;
  const AppBanner({super.key, required this.list});

  @override
  State<AppBanner> createState() => _AppBannerState();
}

class _AppBannerState extends State<AppBanner> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16.0),
          height: 160,
          // decoration: BoxDecoration(color: Colors.orange[100]),
          child: PageView.builder(
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            controller: PageController(viewportFraction: 0.7),
            itemCount: widget.list.length,
            itemBuilder: (BuildContext context, int index) {
              // var banner = widget.list[index];
              var scale = _selectedIndex == index ? 1.0 : 0.8;
              return TweenAnimationBuilder(
                tween: Tween(begin: scale, end: scale),
                duration: const Duration(milliseconds: 150),
                curve: Curves.ease,
                builder: ((context, value, child) => Transform.scale(
                      scale: value,
                      child: child,
                    )),
                child: InkWell(
                    onTap: () async {
                      exercisesInWorkout =
                          await getExercisesInWorkout(widget.list[index].id);
                      for (var i in exercisesInWorkout) {
                        print(i.title);
                        modelWorkout = widget.list[index];
                      }
                      Get.to(const WorkOutScreen());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(30)),
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: DefaultTextStyle(
                        style: headerOne,
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text(widget.list[index].name.toUpperCase())
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
                widget.list.length,
                (index) =>
                    Indicator(isActive: _selectedIndex == index ? true : false))
          ],
        )
      ],
    );
  }
}

class Indicator extends StatelessWidget {
  final bool isActive;
  const Indicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      width: isActive ? 22.0 : 8.0,
      height: 8.0,
      duration: const Duration(milliseconds: 150),
      decoration: BoxDecoration(
          color: isActive ? Colors.purple : Colors.grey,
          borderRadius: BorderRadius.circular(8.0)),
    );
  }
}
