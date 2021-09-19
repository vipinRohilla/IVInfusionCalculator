import 'package:flutter/material.dart';

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
      labelStyle: TextStyle(fontSize: 16, color: Colors.black),
      // border: OutlineInputBorder(),
    ),
    keyboardType: TextInputType.number,
  );
}
