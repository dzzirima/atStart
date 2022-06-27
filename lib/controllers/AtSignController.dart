import 'dart:ffi';

import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:snackbar/model/timerItem.dart';
import 'package:snackbar/utils/MySnackBar.dart';
import 'package:nanoid/nanoid.dart';
import 'package:snackbar/widgets/FocusTimeCard.dart';

class TrackerTimerController extends ChangeNotifier {
  static AtClient atClient = atClientManager.atClient;
  AtClientService? atClientService;
  static var atClientManager = AtClientManager.getInstance();
  static var currentAtsign = atClientManager.atClient.getCurrentAtSign();

  List<TimerItem> myTimers = [];
  List<String> myGroups = [];
  Map<String, double> dataMap = {};

  int numberOfkeys = 0;
  bool loading = false;

  /**function to notify other widgets */
  void getNewData() async {
    myTimers = [];

    await this.getAtSignData("context", "");

    this.numberOfkeys = myTimers.length;
    this.notifyListeners();
    calculateSummaryData();
  }

  static void sendAtSignData(context, TimerItem myTrackerData) async {
    try {
      var metaData = Metadata()
        ..isPublic = true
        ..isEncrypted = true
        ..namespaceAware = true;

      var customLengthId = nanoid(10);
      print(customLengthId);

      var key = AtKey()
        ..key = 'trk' + customLengthId
        ..sharedBy = currentAtsign
        ..metadata = metaData;

      var result = await atClient.put(key, myTrackerData.toJson().toString());

      if (result == true) {
        MySnackBar(context: context).show("Entry added successfully");
      }

      print("Here is your result :" + result.toString());
    } catch (e) {
      print("Error " + e.toString());
    }
  }

  getAtSignData(context, String lookUpKey) async {
    try {
      /**This function is used to lookup the keys 
     * but i have a problem how can i look up if i dont know the keys
     * Solved by getting  scanning the whole atSign seconadry
     */
      AtClient atClient = AtClientManager.getInstance().atClient;
      /**I dont want to repeat copying this thing  */

      //**getting all the time trackers i would have added */
      var userKeys = await atClient.getAtKeys(regex: '[public]:[trk]');
      List<AtKey> receivedKeys = [];

      receivedKeys.addAll(userKeys);
      for (AtKey key in receivedKeys) {
        try {
          if (key.sharedBy != null) {
            AtValue _keyValue = await atClient.get(key);

            //creating a timer here forom json
            myTimers.add(TimerItem.fromJson(_keyValue.value));
          }
        } catch (e) {
          print(e.toString());
        }
      }

      // print("Current atSign:" + currentAtsign!);
      // print("Here are your results :" + trackerTime.value.toString());
    } catch (e) {
      print(e.toString());
    }
  }

  /**funtion to do the calculations and summary data  for the graph */

  void calculateSummaryData() {
    myTimers.forEach((element) {
      //get the groups in the list of dos

      if (!(myGroups.indexOf(element.id) >= 0)) {
        myGroups.add(element.id);
      }
    });
    //create a map of all the categories
    myGroups.forEach((element) {
      dataMap[element] = 0.0;
    });

    //adding the totals  to individual group
    myTimers.forEach((element) {
      
      var focusTime = int.parse(element.endTime) - int.parse(element.startTime);
      dataMap[element.id] = dataMap[element.id]! + focusTime;
    });
  }
}
