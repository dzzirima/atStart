import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FocusTimeCard extends StatelessWidget {
  const FocusTimeCard(
      {Key? key,
      required this.type,
      required this.startTime,
      required this.endTime,
      this.date = ""})
      : super(key: key);
  final String type;
  final String startTime;
  final String endTime;
  final String? date;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(
          Icons.timelapse_rounded,
          color: Colors.blue,
          size: 50,
        ),
        // title: Text('Dev : 22/06/2022'),
        title: RichText(
          text: TextSpan(
            text: "$type :",
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black),
            children: <InlineSpan>[
              const WidgetSpan(
                  alignment: PlaceholderAlignment.baseline,
                  baseline: TextBaseline.alphabetic,
                  child: SizedBox(width: 10)),
              TextSpan(
                text: '$date  :: $startTime - $endTime ',
                // ignore: prefer_const_constructors
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
        subtitle: Text('You focused for :3hrs 24 mins'),
        trailing: const Icon(Icons.more_vert),
      ),
    );
  }
}
