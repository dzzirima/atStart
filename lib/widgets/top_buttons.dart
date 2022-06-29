import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intern_time_tracker/widgets/ActionButton.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({Key? key}) : super(key: key);

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ActionButton(
              text: "Export",
              btnIcon: const Icon(Icons.download_outlined),
              onTap: () {},
            ),
            const SizedBox(height: 10),
            ActionButton(
              text: "Share With",
              btnIcon: const Icon(Icons.share_outlined),
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            ActionButton(
              text: "Summary",
              btnIcon: const Icon(Icons.checklist_outlined),
              onTap: () {},
            ),
            ActionButton(
              text: "Coming Soon..!",
              btnIcon: const Icon(Icons.light_mode_sharp),
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
