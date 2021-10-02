import 'package:flutter/material.dart';
import 'package:flutter_application_2/styling/size_config.dart';

getTextFromTextField(
    String hintTextData,
    String labelTextData,
    List<String> unit,
    String currentItem,
    TextEditingController controllerData) {
  return TextFormField(
    controller: controllerData,
    maxLength: 10,
    decoration: InputDecoration(
      hintText: hintTextData,
      labelText: labelTextData,
      labelStyle: TextStyle(fontSize: 2 * SizeConfig.textMultiplier, color: Colors.black),
      // border: OutlineInputBorder(),
    ),
    keyboardType: TextInputType.number,
  );
}
