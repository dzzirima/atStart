// ignore_for_file: unnecessary_statements

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:at_commons/at_commons.dart';

import 'package:at_onboarding_flutter/at_onboarding_flutter.dart'
    show Onboarding;
import 'package:at_utils/at_logger.dart' show AtSignLogger;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path_provider/path_provider.dart'
    show getApplicationSupportDirectory;
import 'package:at_app_flutter/at_app_flutter.dart' show AtEnv;
import 'package:provider/provider.dart';
import 'package:intern_time_tracker/controllers/AtSignController.dart';
import 'package:intern_time_tracker/providers/GetData.dart';
import 'package:intern_time_tracker/widgets/BottomBar.dart';

//String snack = '';
Future<void> main() async {
  await AtEnv.load();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GetDataProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => TrackerTimerController(),
        )
      ],
      child: MaterialApp(home: MyApp()),
    ),
  );
}

Future<AtClientPreference> loadAtClientPreference() async {
  var dir = await getApplicationSupportDirectory();
  return AtClientPreference()
        ..rootDomain = AtEnv.rootDomain
        ..namespace = AtEnv.appNamespace
        ..hiveStoragePath = dir.path
        ..commitLogPath = dir.path
        ..isLocalStoreRequired = true
      // TODO set the rest of your AtClientPreference here
      ;
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // * load the AtClientPreference in the background
  Future<AtClientPreference> futurePreference = loadAtClientPreference();
  AtClientPreference? atClientPreference;

  final AtSignLogger _logger = AtSignLogger(AtEnv.appNamespace);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // * The onboarding screen (first screen)
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Securely Track Your Activities'),
        //   centerTitle: true,
        // ),
        body: SafeArea(
          child: Column(
            children: [
              const Spacer(),
              Image.asset(
                "assets/meditatation.png",
                height: 250,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "The key is in not spending time,\nbut in investing it..",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "The shorter way to do many things is to only do \n one thing at a time.",
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              SizedBox(
                height: 60,
                width: 100,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(), primary: Colors.black87),
                    onPressed: () async {
                      var preference = await futurePreference;
                      setState(() {
                        atClientPreference = preference;
                      });
                      Onboarding(
                        context: context,
                        atClientPreference: atClientPreference!,
                        domain: AtEnv.rootDomain,
                        rootEnvironment: AtEnv.rootEnvironment,
                        appAPIKey: AtEnv.appApiKey,
                        onboard: (value, atsign) {
                          _logger.finer('Successfully onboarded $atsign');
                        },
                        onError: (error) {
                          _logger.severe('Onboarding throws $error error');
                        },
                        nextScreen: const BottomBar(),
                      );
                    },
                    // child: SvgPicture.asset(
                    //   "/closes.svg",
                    //   fit: BoxFit.contain,
                    // ),
                    child: Icon(Icons.arrow_forward)),
              ),
              const SizedBox(height: 5),
              Text(
                "..onBoard@Sign..",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w200,
                    color: Color.fromARGB(255, 29, 28, 28)),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
