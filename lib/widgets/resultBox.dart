import 'package:flutter/material.dart';

getResultBox() {
  return SizedBox(
    height: 100,
    child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.green[600]),
        child: Text("Result : ",
            style: TextStyle(
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
                color: Colors.white))),
  );
}
