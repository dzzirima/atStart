//this screen contains the working hours you have done

import 'package:flutter/material.dart';
import 'package:intern_time_tracker/controllers/DateController.dart';
import 'package:provider/provider.dart';
import 'package:intern_time_tracker/constants/GlobalVariables.dart';
import 'package:intern_time_tracker/controllers/AtSignController.dart';
import 'package:intern_time_tracker/model/timerItem.dart';

import 'package:intern_time_tracker/widgets/CustomButton.dart';
import 'package:intern_time_tracker/widgets/CustomeEditText.dart';
import 'package:intern_time_tracker/widgets/FocusTimeCard.dart';
import 'package:intern_time_tracker/widgets/WorkingHoursSummary.dart';

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
    var dataProvider =
        Provider.of<TrackerTimerController>(context, listen: true);
    List<TimerItem> myTimers = dataProvider.myTimers;

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
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: dataProvider.numberOfkeys,
                  itemBuilder: (BuildContext context, int index) {
                    return FocusTimeCard(
                      type: myTimers[index].id,
                      startTime: myTimers[index].startTime,
                      endTime: myTimers[index].endTime,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return print(DateController.calculateTimeInterval(
              DateController.getCurrentDate(),
              DateController.getCurrentDate()));
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
    TimerItem newTrackerData = new TimerItem(category, startTimeController.text,
        endTimeController.text, descriptionController.text);

    //sending to the server
    TrackerTimerController.sendAtSignData(context, newTrackerData);

    Navigator.of(context).pop();
  }
}
