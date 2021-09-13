import 'package:flutter/material.dart';

getAppBar(String titleData) {
  return AppBar(
    iconTheme: IconThemeData(color: Colors.white),
    backgroundColor: Colors.blue[600],
    elevation: 0,
    title: Text(
      titleData,
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, wordSpacing: 4),
    ),
  );
}
