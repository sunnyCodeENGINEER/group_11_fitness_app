import 'package:fitness_app/pie%20chart/widget/indicators_widget.dart';
import 'package:fitness_app/pie%20chart/widget/pie_chart_sections.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartPage extends StatefulWidget {
  const PieChartPage({super.key});

  @override
  State<StatefulWidget> createState() => PieChartPageState();
}

class PieChartPageState extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) => Card(
        child: Column(
          children: <Widget>[
            Expanded(
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (p0, pieTouchResponse) {
                      setState(() {
                        if (pieTouchResponse is FlLongPressEnd
                            // ||
                            // pieTouchResponse is FlPanEndEvent
                            ) {
                          touchedIndex = -1;
                        } else {
                          touchedIndex = pieTouchResponse!
                              .touchedSection!.touchedSectionIndex;
                        }
                      });
                    },
                    // touchCallback: (pieTouchResponse) {
                    //   setState(() {
                    //     if (pieTouchResponse.touchInput is FlLongPressEnd ||
                    //         pieTouchResponse.touchInput is FlPanEnd) {
                    //       touchedIndex = -1;
                    //     } else {
                    //       touchedIndex = pieTouchResponse.touchedSectionIndex;
                    //     }
                    //   });
                    // },
                  ),
                  borderData: FlBorderData(show: false),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: getSections(touchedIndex),
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: IndicatorsWidget(),
                ),
              ],
            ),
          ],
        ),
      );
}
