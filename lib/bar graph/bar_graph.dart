// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bar_graph/bar%20graph/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyBarGraph extends StatelessWidget {
  final List weeklySummary; //[sunAmount, monAmount,  ...., satAmount ]
  const MyBarGraph({
    Key? key,
    required this.weeklySummary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //initialize bar data
    BarData myBarData = BarData(
      sunAmount: weeklySummary[0],
      monAmount: weeklySummary[1],
      tueAmount: weeklySummary[2],
      wedAmount: weeklySummary[3],
      thuAmount: weeklySummary[4],
      friAmount: weeklySummary[5],
      satAmount: weeklySummary[6],
    );
    myBarData.initializeBarData();
    return BarChart(
      BarChartData(
        maxY: 200,
        minY: 0,
        barGroups: myBarData.barData
            .map(
              (data) => BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(toY: data.y),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
