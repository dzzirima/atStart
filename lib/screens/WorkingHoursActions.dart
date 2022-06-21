import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snackbar/widgets/top_buttons.dart';

class WorkingHoursActions extends StatelessWidget {
  const WorkingHoursActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const SizedBox(height: 150),
              const TopButtons(),
              const SizedBox(
                height: 30,
              ),
              const Divider(
                height: 2,
                thickness: 1,
                indent: 20,
                endIndent: 0,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
