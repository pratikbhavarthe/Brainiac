import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class _LineChart extends StatelessWidget {
  const _LineChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: true),
        titlesData: titlesData,
        borderData: borderData,
        lineBarsData: lineBarsData,
        maxY: 10,
      ),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
    show: true,
    bottomTitles: SideTitles(
      showTitles: true,
      getTextStyles: (context, value) => const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      margin: 20,
      getTitles: (double value) {
        switch (value.toInt()) {
          case 0:
            return 'Mon';
          case 1:
            return 'Tue';
          case 2:
            return 'Wed';
          case 3:
            return 'Thu';
          case 4:
            return 'Fri';
          case 5:
            return 'Sat';
          case 6:
            return 'Sun';
          default:
            return '';
        }
      },
      rotateAngle: 0, // Rotates the labels for better visibility
      interval: 1, // Displays every label
    ),
    leftTitles: SideTitles(showTitles: true),
    topTitles: SideTitles(showTitles: false),
    rightTitles: SideTitles(showTitles: false),
  );

  FlBorderData get borderData => FlBorderData(
    show: true,
    border: Border.all(color: const Color(0xff37434d), width: 1),
  );

  List<LineChartBarData> get lineBarsData => [
    LineChartBarData(
      spots: [
        FlSpot(0, 4),
        FlSpot(1, 5),
        FlSpot(2, 3),
        FlSpot(3, 3),
        FlSpot(4, 3),
        FlSpot(5, 6),
      ],
      isCurved: true,
      colors: [Colors.orange],
      dotData: FlDotData(show: true),
      belowBarData: BarAreaData(show: false),
    ),
    LineChartBarData(
      spots: [
        FlSpot(0, 6),
        FlSpot(1, 4),
        FlSpot(2, 5),
        FlSpot(3, 7),
        FlSpot(4, 6),
        FlSpot(5, 8),
      ],
      isCurved: true,
      colors: [Colors.teal],
      dotData: FlDotData(show: true),
      belowBarData: BarAreaData(show: false),
    ),
    LineChartBarData(
      spots: [
        FlSpot(0, 3),
        FlSpot(1, 2),
        FlSpot(2, 4),
        FlSpot(3, 3),
        FlSpot(4, 5),
        FlSpot(5, 4),
      ],
      isCurved: true,
      colors: [Colors.red],
      dotData: FlDotData(show: true),
      belowBarData: BarAreaData(show: false),
    ),
    LineChartBarData(
      spots: [
        FlSpot(0, 8),
        FlSpot(1, 6),
        FlSpot(2, 7),
        FlSpot(3, 9),
        FlSpot(4, 7),
        FlSpot(5, 10),
      ],
      isCurved: true,
      colors: [Colors.blue],
      dotData: FlDotData(show: true),
      belowBarData: BarAreaData(show: false),
    ),
  ];
}

class LineChartSample extends StatefulWidget {
  const LineChartSample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LineChartSampleState();
}

class LineChartSampleState extends State<LineChartSample> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 5/2,
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: const _LineChart(),
      ),
    );
  }
}

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Line Chart Sample'),
      ),
      body: Center(
        child: LineChartSample(),
      ),
    ),
  ),
);
