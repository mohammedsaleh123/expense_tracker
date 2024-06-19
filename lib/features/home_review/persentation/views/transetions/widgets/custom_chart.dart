// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// class CustomChart extends StatelessWidget {
//   const CustomChart({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BarChart(
//       BarChartData(
//         barTouchData: barTouchData,
//         titlesData: titlesData,
//         borderData: borderData,
//         barGroups: barGroups,
//         gridData: const FlGridData(show: false),
//         alignment: BarChartAlignment.spaceAround,
//         maxY: 20,
//       ),
//     );
//   }

//   BarTouchData get barTouchData => BarTouchData(
//         enabled: false,
//         touchTooltipData: BarTouchTooltipData(
//           getTooltipColor: (group) => Colors.transparent,
//           tooltipPadding: EdgeInsets.zero,
//           tooltipMargin: 8,
//           getTooltipItem: (
//             BarChartGroupData group,
//             int groupIndex,
//             BarChartRodData rod,
//             int rodIndex,
//           ) {
//             return BarTooltipItem(
//               rod.toY.round().toString(),
//               const TextStyle(
//                 color: Colors.cyan,
//                 fontWeight: FontWeight.bold,
//               ),
//             );
//           },
//         ),
//       );

//   Widget getTitles(double value, TitleMeta meta) {
//     const style = TextStyle(
//       color: Colors.blue,
//       fontWeight: FontWeight.bold,
//       fontSize: 14,
//     );
//     String text;
//     switch (value.toInt()) {
//       case 0:
//         text = 'Mn';
//         break;
//       case 1:
//         text = 'Te';
//         break;
//       case 2:
//         text = 'Wd';
//         break;
//       case 3:
//         text = 'Tu';
//         break;
//       case 4:
//         text = 'Fr';
//         break;
//       case 5:
//         text = 'St';
//         break;
//       case 6:
//         text = 'Sn';
//         break;
//       default:
//         text = '';
//         break;
//     }
//     return SideTitleWidget(
//       axisSide: meta.axisSide,
//       space: 4,
//       child: Text(text, style: style),
//     );
//   }

//   FlTitlesData get titlesData => FlTitlesData(
//         show: true,
//         bottomTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: true,
//             reservedSize: 30,
//             getTitlesWidget: getTitles,
//           ),
//         ),
//         leftTitles: const AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//         topTitles: const AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//         rightTitles: const AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//       );

//   FlBorderData get borderData => FlBorderData(
//         show: false,
//       );

//   LinearGradient get _barsGradient => const LinearGradient(
//         colors: [
//           Colors.blue,
//           Colors.cyan,
//         ],
//         begin: Alignment.bottomCenter,
//         end: Alignment.topCenter,
//       );

//   List<BarChartGroupData> get barGroups => [
//         BarChartGroupData(
//           x: 0,
//           barRods: [
//             BarChartRodData(
//               toY: 8,
//               gradient: _barsGradient,
//             )
//           ],
//           showingTooltipIndicators: [0],
//         ),
//         BarChartGroupData(
//           x: 1,
//           barRods: [
//             BarChartRodData(
//               toY: 10,
//               gradient: _barsGradient,
//             )
//           ],
//           showingTooltipIndicators: [0],
//         ),
//         BarChartGroupData(
//           x: 2,
//           barRods: [
//             BarChartRodData(
//               toY: 14,
//               gradient: _barsGradient,
//             )
//           ],
//           showingTooltipIndicators: [0],
//         ),
//         BarChartGroupData(
//           x: 3,
//           barRods: [
//             BarChartRodData(
//               toY: 15,
//               gradient: _barsGradient,
//             )
//           ],
//           showingTooltipIndicators: [0],
//         ),
//         BarChartGroupData(
//           x: 4,
//           barRods: [
//             BarChartRodData(
//               toY: 13,
//               gradient: _barsGradient,
//             )
//           ],
//           showingTooltipIndicators: [0],
//         ),
//         BarChartGroupData(
//           x: 5,
//           barRods: [
//             BarChartRodData(
//               toY: 10,
//               gradient: _barsGradient,
//             )
//           ],
//           showingTooltipIndicators: [0],
//         ),
//         BarChartGroupData(
//           x: 6,
//           barRods: [
//             BarChartRodData(
//               toY: 16,
//               gradient: _barsGradient,
//             )
//           ],
//           showingTooltipIndicators: [0],
//         ),
//       ];
// }

// class BarChartSample3 extends StatefulWidget {
//   const BarChartSample3({super.key});

//   @override
//   State<StatefulWidget> createState() => BarChartSample3State();
// }

// class BarChartSample3State extends State<BarChartSample3> {
//   @override
//   Widget build(BuildContext context) {
//     return const AspectRatio(
//       aspectRatio: 1.6,
//       child: CustomChart(),
//     );
//   }
// }

import 'package:expense_tracker/features/home_review/domain/entities/transaction_entity.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeeklyExpenseChart extends StatelessWidget {
  final List<TransactionEntity> transactions;

  const WeeklyExpenseChart({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              barGroups: _generateWeeklyData(),
              titlesData: FlTitlesData(
                topTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                leftTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      switch (value.toInt()) {
                        case 1:
                          return const Text('Mon');
                        case 2:
                          return const Text('Tue');
                        case 3:
                          return const Text('Wed');
                        case 4:
                          return const Text('Thu');
                        case 5:
                          return const Text('Fri');
                        case 6:
                          return const Text('Sat');
                        case 7:
                          return const Text('Sun');
                        default:
                          return const Text('');
                      }
                    },
                  ),
                ),
              ),
              borderData: FlBorderData(show: true),
              gridData: FlGridData(show: false),
            ),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _generateWeeklyData() {
    final days = List.filled(7, 0.0);

    for (var transaction in transactions) {
      final dayIndex = (DateTime.parse(transaction.transactionDate).weekday -
          1); // Monday = 1, Sunday = 7
      days[dayIndex] += transaction.expense;
    }

    return List.generate(7, (index) {
      return BarChartGroupData(
        x: index + 1,
        barRods: [
          BarChartRodData(
            toY: days[index],
            color: Colors.lightBlueAccent,
          ),
        ],
      );
    });
  }
}

class MonthlyExpenseChart extends StatelessWidget {
  final List<TransactionEntity> transactions;

  const MonthlyExpenseChart({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              barGroups: _generateMonthlyData(),
              titlesData: FlTitlesData(
                leftTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: true)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      switch (value.toInt()) {
                        case 0:
                          return const Text('Jan');
                        case 1:
                          return const Text('Feb');
                        case 2:
                          return const Text('Mar');
                        case 3:
                          return const Text('Apr');
                        case 4:
                          return const Text('May');
                        case 5:
                          return const Text('Jun');
                        case 6:
                          return const Text('Jul');
                        case 7:
                          return const Text('Aug');
                        case 8:
                          return const Text('Sep');
                        case 9:
                          return const Text('Oct');
                        case 10:
                          return const Text('Nov');
                        case 11:
                          return const Text('Dec');
                        default:
                          return const Text('');
                      }
                    },
                  ),
                ),
              ),
              borderData: FlBorderData(show: false),
            ),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _generateMonthlyData() {
    final months = List.filled(12, 0.0);

    for (var transaction in transactions) {
      final monthIndex =
          DateTime.parse(transaction.transactionDate).month - 1; // January = 1
      months[monthIndex] += transaction.expense;
    }

    return List.generate(12, (index) {
      return BarChartGroupData(
        x: index + 1,
        barsSpace: 40,
        barRods: [
          BarChartRodData(
            toY: months[index],
            color: Colors.lightBlueAccent,
          ),
        ],
      );
    });
  }
}
