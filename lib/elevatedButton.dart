import 'package:flutter/material.dart';

getElevatedButton(String buttonText, Color colorData) {
  return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(colorData),
          minimumSize:
              MaterialStateProperty.all<Size>(Size(double.infinity, 40))),
      onPressed: () {},
      child: Text(buttonText));
}
