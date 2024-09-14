import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomLineChart extends StatelessWidget {
  CustomLineChart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxY: 12.0, // Adjust this value to be greater than the maximum Y-value in your data
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(2, 10.5973),
              FlSpot(3, 9.4727),
              FlSpot(4, 8.4675),
              FlSpot(5, 7.5689),
              FlSpot(6, 6.7657),
            ],
            color: Color(0xffFF0000),
          ),
        ],
      ),
    );
  }
}

