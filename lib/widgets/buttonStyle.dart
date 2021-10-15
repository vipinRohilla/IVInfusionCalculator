import 'package:flutter/material.dart';

getButtonStyle(Color colorData) {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(colorData),
    minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 40)),
  );
}
