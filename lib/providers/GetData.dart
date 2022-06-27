import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:flutter/cupertino.dart';

import 'package:snackbar/controllers/AtSignController.dart';
import 'package:snackbar/model/timerItem.dart';

class GetDataProvider extends ChangeNotifier {
  TrackerTimerController timerController = new TrackerTimerController();

  List<AtKey> myKeys = [];
  int _count = 0;
  int numberOfkeys = 0;
  bool loading = false;
  int get count => _count;
  List<TimerItem> myTimers = [];

  void setListOfTimers(List<TimerItem> myyTimers) {
    print(this.myTimers);
    this.myTimers = myyTimers;
    print(".................." + this.myTimers.toString());
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
    _count++;
    numberOfkeys++;

    notifyListeners();
    print("counter value :" + _count.toString());
  }
}
