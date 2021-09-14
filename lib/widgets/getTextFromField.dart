import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/dropDown.dart';

getTextFromTextField(String hintTextData, String labelTextData,
    List<String> unit, String currentItem) {
  return TextFormField(
    maxLength: 10,
    decoration: InputDecoration(
      hintText: hintTextData,
      labelText: labelTextData,
      labelStyle: TextStyle(fontSize: 16, color: Colors.black),
      border: OutlineInputBorder(),
      suffixIcon: DropDown(unit: unit, currentItem: currentItem),
    ),
    keyboardType: TextInputType.number,
  );
}
