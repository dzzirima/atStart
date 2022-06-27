import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snackbar/controllers/AtSignController.dart';
import 'package:snackbar/providers/GetData.dart';
import 'package:snackbar/widgets/PieChartSummary.dart';

class WorkingHoursSummary extends StatefulWidget {
  const WorkingHoursSummary({Key? key}) : super(key: key);

  @override
  State<WorkingHoursSummary> createState() => _WorkingHoursSummaryState();
}

class _WorkingHoursSummaryState extends State<WorkingHoursSummary> {
  TrackerTimerController timerController = new TrackerTimerController();

  @override
  Widget build(BuildContext context) {
    //provider listen , means dont change ..
    var provider = Provider.of<GetDataProvider>(context, listen: false);

    return Container(
      child: GestureDetector(
        onTap: () {
          //change the internal structure of the global state of the provider
          provider.increment();
        },
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(10),
          dashPattern: const [10, 4],
          strokeCap: StrokeCap.round,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const PieChartSummary(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
