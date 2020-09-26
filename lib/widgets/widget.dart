import 'package:flutter/material.dart';

Widget brandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        "Wall",
        style: TextStyle(color: Colors.black87),
      ),
      Text(
        "Papelz",
        style: TextStyle(color: Colors.blue),
      )
    ],
  );
}
