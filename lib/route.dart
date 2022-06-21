import 'package:flutter/material.dart';
import 'package:snackbar/screens/workingHours.dart';

// The onGenearte callback function in the main file allows us to pass arguments
//  to the next screen.
//

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case WorkingHours.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const WorkingHours(),
      );

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text("Page does not exist"),
          ),
        ),
      );
  }
}
