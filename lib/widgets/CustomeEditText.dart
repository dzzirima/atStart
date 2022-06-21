// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomeTextField extends StatelessWidget {
  //getting the controller and hint text
  const CustomeTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    //by default but if specified this value will be overriden
    this.maxLines = 1,
  }) : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    //returning textform field allows use to do validations
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        ),
      ),
      //gettin the validator
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your $hintText';
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}
