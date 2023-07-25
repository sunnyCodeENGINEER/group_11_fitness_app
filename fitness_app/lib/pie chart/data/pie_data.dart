import 'package:flutter/material.dart';

class PieData {
  static List<Data> data = [
    Data(
        name: 'Protein',
        percent: proteinPercent,
        color: const Color.fromARGB(255, 199, 2, 238)),
    Data(
        name: 'Carbohydrates',
        percent: carbsPercent,
        color: const Color.fromARGB(255, 247, 154, 236)),
    Data(
        name: 'Fats',
        percent: fatsPercent,
        color: const Color.fromARGB(255, 121, 4, 92)),
    //Data(name: 'Green', percent: 15, color: const Color(0xff13d38e)),
  ];
}

class Data {
  final String name;

  final double percent;

  final Color color;

  Data({required this.name, required this.percent, required this.color});
}

double proteinPercent = 40;
double fatsPercent = 40;
double carbsPercent = 40;
