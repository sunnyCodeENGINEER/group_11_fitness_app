import 'package:flutter/material.dart';

class PieData {
  static List<Data> data = [
    Data(
        name: 'Protein',
        percent: 40,
        color: const Color.fromARGB(255, 199, 2, 238)),
    Data(
        name: 'Carbohydrates',
        percent: 50,
        color: const Color.fromARGB(255, 247, 154, 236)),
    Data(
        name: 'Fats',
        percent: 20,
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
