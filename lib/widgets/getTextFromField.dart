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
    maxLength: 8,
    decoration: InputDecoration(
      counter: Offstage(),
      hintText: hintTextData,
      labelText: labelTextData,
      labelStyle: TextStyle(fontSize: 2 * SizeConfig.textMultiplier, color: Colors.black),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(0), borderSide: BorderSide(color: Colors.blue.shade400, width: 1.5)),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(0), borderSide: BorderSide(color: Colors.blue.shade400, width: 1.5)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(0), borderSide: BorderSide(color: Colors.blue.shade400, width: 1.5)), 
    ),
    keyboardType: TextInputType.number,
  );
}
