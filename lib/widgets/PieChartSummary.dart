import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:intern_time_tracker/controllers/AtSignController.dart';
import 'package:intern_time_tracker/providers/GetData.dart';

class PieChartSummary extends StatefulWidget {
  const PieChartSummary({Key? key}) : super(key: key);

  @override
  State<PieChartSummary> createState() => _PieChartSummaryState();
}

class _PieChartSummaryState extends State<PieChartSummary> {
  Map<String, double> dataMap = {
    "Dev": 18.47,
    "MKT": 17.70,
    "Doc": 4.25,
    "Desig": 3.51,
    "Other": 2.83,
    "fun": 2.83,
  };

  List<Color> colorList = [
    const Color(0xffD95AF3),
    const Color(0xff3EE094),
    const Color(0xff3398F6),
    const Color(0xffFA4A42),
    const Color(0xffFE9539)
  ];

  final gradientList = <List<Color>>[
    [
      Color.fromRGBO(223, 250, 92, 1),
      Color.fromRGBO(129, 250, 112, 1),
    ],
    [
      Color.fromRGBO(129, 182, 205, 1),
      Color.fromRGBO(91, 253, 199, 1),
    ],
    [
      Color.fromRGBO(175, 63, 62, 1.0),
      Color.fromRGBO(254, 154, 92, 1),
    ]
  ];
  @override
  Widget build(BuildContext context) {
    //provider declaration for the consumer :here listen= true means rebuld
    var dataProvider =
        Provider.of<TrackerTimerController>(context, listen: true);

    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text("start"),
                const SizedBox(
                  width: 50,
                ),
                const Text("End"),
                const SizedBox(
                  width: 50,
                ),
                const Text("17 June  -> 20 June")
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            PieChart(
              dataMap: (dataProvider.dataMap).isNotEmpty
                  ? dataProvider.dataMap
                  : dataMap,
              colorList: colorList,
              chartRadius: MediaQuery.of(context).size.width / 2,
              //consuming the provider value
              centerText: '${(dataProvider.totalWorkingHours) / 100} : Hours',
              ringStrokeWidth: 20,
              chartType: ChartType.ring,
              animationDuration: const Duration(seconds: 3),
              chartValuesOptions: const ChartValuesOptions(
                  showChartValues: true,
                  showChartValuesOutside: false,
                  showChartValuesInPercentage: false,
                  showChartValueBackground: false),
              legendOptions: const LegendOptions(
                showLegends: true,
                legendShape: BoxShape.rectangle,
                legendTextStyle: TextStyle(fontSize: 10),
                // legendPosition: LegendPosition.bottom,
                // showLegendsInRow: true
              ),
              gradientList: gradientList,
            ),
          ],
        ),
      ),
    );
  }
}
