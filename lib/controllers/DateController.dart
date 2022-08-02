// ignore: unused_import
import 'package:dart_date/dart_date.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class DateController {
  static String getCurrentDate() {
    var currentDate = new DateTime.now();
    var myDateFormatter = new DateFormat.yMMMMd().add_jm();

    var formattedDate = myDateFormatter.format(currentDate);

    return currentDate.toString();
  }

  static String getDateTime(String date) {
    try {
      final parsedDate = DateTime.parse(date);
      var hoursAndMinutes = parsedDate.format('h:mm:ss a');

      print(hoursAndMinutes);
      return hoursAndMinutes;
    } catch (e) {
      //what happens when the code throws an exception
      print(e.toString());
    }

    return "";
  }

  static calculateTimeInterval(String from, String endDate) {
    try {
      final startDate = DateTime.parse(from);
      final endDate = DateTime.parse("August 2, 2022 10:40 AM");

      int seconds = endDate.difference(startDate).inSeconds;
      if (seconds < 60)
        return '$seconds second';
      else if (seconds >= 60 && seconds < 3600)
        return '${startDate.difference(endDate).inMinutes.abs()} minute';
      else if (seconds >= 3600 && seconds < 86400)
        return '${startDate.difference(endDate).inHours} hour';
      else
        return '${startDate.difference(endDate).inDays} day';
    } catch (e) {
      // Fluttertoast.showToast(
      //     msg: "This is Center Short Toast",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
    }
  }
}
