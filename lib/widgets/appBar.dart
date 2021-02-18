import 'package:flutter/material.dart';

Widget appBar({String title}) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.transparent,
    title: Text(
      title,
      style: TextStyle(color: Colors.teal),
    ),
  );
}
