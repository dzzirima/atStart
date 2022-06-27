import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:flutter/cupertino.dart';

import 'package:snackbar/controllers/AtSignController.dart';

class GetDataProvider extends ChangeNotifier {
  TrackerTimerController timerController = new TrackerTimerController();

  List<AtKey> myKeys = [];
  int _count = 0;
  int numberOfkeys = 0;
  bool loading = false;
  int get count => _count;

  void getRemoteKeys() {
    print("in here gett getting the data  from the server");
    loading = true;
    _count = 67;
    loading = false;
    notifyListeners();
  }

  void increment() {
    _count++;
    numberOfkeys++;

    notifyListeners();
    print("counter value :" + _count.toString());
  }
}
