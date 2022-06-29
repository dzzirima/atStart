import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:flutter/cupertino.dart';

import 'package:intern_time_tracker/controllers/AtSignController.dart';
import 'package:intern_time_tracker/model/timerItem.dart';

class GetDataProvider extends ChangeNotifier {
  TrackerTimerController timerController = new TrackerTimerController();
  int numberOfkeys = 0;
  bool loading = false;

  List<TimerItem> myTimers = [];

  void setListOfTimers(List<TimerItem> myyTimers) {
    myTimers.addAll(myyTimers);
    this.numberOfkeys = this.myTimers.length;
    this.increment();
    notifyListeners();
    print(this.numberOfkeys);
  }

  void getRemoteKeys() {
    try {
      loading = true;
      // create  a list of timer things
      loading = false;
      print(myTimers);

      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  void increment() {
    numberOfkeys++;

    notifyListeners();
  }
}
