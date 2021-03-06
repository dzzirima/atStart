//this screen contains the working hours you have done

import 'package:flutter/material.dart';
import 'package:snackbar/constants/GlobalVariables.dart';
import 'package:snackbar/controllers/AtSignController.dart';
import 'package:snackbar/model/timerItem.dart';
import 'package:snackbar/utils/MySnackBar.dart';
import 'package:snackbar/utils/templates/template.dart';
import 'package:snackbar/widgets/CustomButton.dart';
import 'package:snackbar/widgets/CustomeEditText.dart';
import 'package:snackbar/widgets/FocusTimeCard.dart';
import 'package:snackbar/widgets/WorkingHoursSummary.dart';

class WorkingHours extends StatefulWidget {
  const WorkingHours({Key? key}) : super(key: key);
  static const String routeName = "/workiHours";

  @override
  State<WorkingHours> createState() => _WorkingHoursState();
}

class _WorkingHoursState extends State<WorkingHours> {
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  String category = 'Dev';
  @override
  void dispose() {
    super.dispose();
    startTimeController.dispose();
    descriptionController.dispose();
    endTimeController.dispose();
  }

  List<String> productCategories = [
    'Dev',
    'MKT',
    'Design',
    'Doc',
    'Fun',
    'ETC'
  ];

  @override
  Widget build(BuildContext context) {
    TrackerTimerController timerController = new TrackerTimerController();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              const SizedBox(height: 10),
              const WorkingHoursSummary(),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: const [
                    FocusTimeCard(
                        type: "Dev",
                        date: "28-06-2022",
                        endTime: "1600",
                        startTime: '1300'),
                    FocusTimeCard(
                        type: "Dev",
                        date: "28-06-2022",
                        endTime: "1600",
                        startTime: '1300'),
                    FocusTimeCard(
                        type: "Dev",
                        date: "28-06-2022",
                        endTime: "1600",
                        startTime: '1300'),
                    FocusTimeCard(
                        type: "Dev",
                        date: "28-06-2022",
                        endTime: "1600",
                        startTime: '1300'),
                    FocusTimeCard(
                        type: "Dev",
                        date: "28-06-2022",
                        endTime: "1600",
                        startTime: '1300'),
                    FocusTimeCard(
                        type: "Dev",
                        date: "28-06-2022",
                        endTime: "1600",
                        startTime: '1300'),
                    FocusTimeCard(
                        type: "Dev",
                        date: "28-06-2022",
                        endTime: "1600",
                        startTime: '1300'),
                    FocusTimeCard(
                        type: "MkT",
                        date: "23-06-2022",
                        endTime: "1700",
                        startTime: '1330'),
                    FocusTimeCard(
                        type: "MkT",
                        date: "23-06-2022",
                        endTime: "1800",
                        startTime: '1400'),
                    FocusTimeCard(
                        type: "Dev",
                        date: "23-06-2022",
                        endTime: "1600",
                        startTime: '1300'),
                    FocusTimeCard(
                        type: "MkT",
                        date: "23-06-2022",
                        endTime: "1700",
                        startTime: '1330'),
                    FocusTimeCard(
                        type: "MkT",
                        date: "23-06-2022",
                        endTime: "1800",
                        startTime: '1400'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openDialog();
        },
        backgroundColor: GlobalVariables.selectedNavBarColor,
        tooltip: 'Add New',
        child: const Icon(Icons.add),
      ),
    );
  }

  Future openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          // ignore: prefer_const_constructors
          title: Center(
            child: const Text(
              "Start Timing",
              style: TextStyle(color: Colors.green),
            ),
          ),
          content: Container(
            constraints: const BoxConstraints(
                minWidth: 0, maxWidth: 300, maxHeight: 400),
            padding: const EdgeInsets.all(0),
            width: 300.0,
            height: 300.0,
            child: Column(
              children: [
                CustomeTextField(
                  controller: startTimeController,
                  hintText: 'Start Time',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomeTextField(
                  controller: endTimeController,
                  hintText: 'End Time',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomeTextField(
                  controller: descriptionController,
                  hintText: 'Dev experiencess are  worthy to be  remembered !!',
                  maxLines: 2,
                ),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: category,
                    onTap: () {},
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: productCategories.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newVal) {
                      setState(() {
                        category = newVal!;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          actions: [CustomButton(text: "ADD NEW ENTRY", onTap: submit)],
        ),
      );
  void submit() {
    TimerItem newTrackerData = new TimerItem(
        "davidtext",
        startTimeController.text,
        endTimeController.text,
        descriptionController.text);

    //sending to the server
    TrackerTimerController.sendAtSignData(context, newTrackerData);

    Navigator.of(context).pop();
  }
}
