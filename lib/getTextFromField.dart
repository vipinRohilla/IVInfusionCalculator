import 'package:flutter/material.dart';

getTextFromTextField(
    String hintTextData, String labelTextData, String suffixTextData) {
  return TextFormField(
    decoration: InputDecoration(
      hintText: hintTextData,
      labelText: labelTextData,
      labelStyle: TextStyle(fontSize: 16, color: Colors.black),
      border: OutlineInputBorder(),
      suffixText: suffixTextData,
    ),
    keyboardType: TextInputType.number,
  );
}
