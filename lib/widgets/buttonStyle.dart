import 'package:flutter/material.dart';

getButtonStyle() {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
    minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 40)),
  );
}
