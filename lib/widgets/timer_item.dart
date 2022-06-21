import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TimerItem extends StatelessWidget {
  const TimerItem({Key? key, required String start, required String end})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: (Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              "18:00",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
            const Text(
              "18:00",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
            const Text(
              "18:00",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
