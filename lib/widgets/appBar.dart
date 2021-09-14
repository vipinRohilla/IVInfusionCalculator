import 'package:flutter/material.dart';

getAppBar(String titleData) {
  return AppBar(
    iconTheme: IconThemeData(color: Colors.blue),
    backgroundColor: Colors.blue[50],
    elevation: 1,
    title: Text(
      titleData,
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, wordSpacing: 4),
    ),
  );
}
