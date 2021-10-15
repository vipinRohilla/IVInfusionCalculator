import 'package:flutter/material.dart';
import 'package:flutter_application_2/styling/size_config.dart';

getAppBar(String titleData) {
  double myFontSize = 2.1 * SizeConfig.textMultiplier;
  return AppBar(
    iconTheme: IconThemeData(color: Colors.blue),
    backgroundColor: Colors.blue.shade50,
    elevation: 1,
    title: Text(
      titleData,
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w500, wordSpacing: 4, fontSize: myFontSize),
    ),
  );
}
