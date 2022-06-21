import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.btnIcon,
  }) : super(key: key);
  final String text;

  final VoidCallback onTap;
  final Icon btnIcon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 100,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 0,
            ),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white),
        child: OutlinedButton.icon(
          icon: IconButton(
            icon: btnIcon,
            disabledColor: Colors.black,
            iconSize: 24,
            color: Colors.black,
            onPressed: null,
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.greenAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: onTap,
          label: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
