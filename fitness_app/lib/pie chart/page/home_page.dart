import 'package:fitness_app/pie%20chart/page/pie_chart_page.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        // appBar: AppBar(title: Text(MyApp.title), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: PageView(
            children: [
              PieChartPage(),
            ],
          ),
        ),
      );
}
