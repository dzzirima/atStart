import 'dart:convert';

import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:snackbar/model/timerItem.dart';
import 'package:snackbar/utils/MySnackBar.dart';
import 'package:snackbar/utils/templates/template.dart';
import 'package:uuid/uuid.dart';
import 'package:nanoid/nanoid.dart';

class TrackerTimerController {
  static AtClient atClient = atClientManager.atClient;
  AtClientService? atClientService;
  static var atClientManager = AtClientManager.getInstance();
  static var currentAtsign = atClientManager.atClient.getCurrentAtSign();

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

  void getAtSignData(context, String lookUpKey) async {
    String RegExp = "/.*/";
    // regex: '^cached:.*@.+\$',

    try {
      AtClient atClient = AtClientManager.getInstance().atClient;
      var currentAtsign = atClient.getCurrentAtSign();

      var metaData = Metadata()
        ..isPublic = true
        ..isEncrypted = true
        ..namespaceAware = true;

      var key = AtKey()
        ..key = 'trkzirima'
        ..metadata = metaData;

      //**getting all the time trackers i would have added */
      var userKeys = await atClient.getAtKeys(sharedBy: currentAtsign);
      /**specify the name of  key and get the corresponding data of the key   */
      var trackerTime = await atClient.get(key);

      print("Here are your keys :" + userKeys.toString());
    } catch (e) {
      print(e.toString());
    }
  }
}
