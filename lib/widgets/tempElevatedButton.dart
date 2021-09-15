import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TempElevatedButton extends StatefulWidget {
  String buttonText;
  var data1, data2;
  Color colorData;
  Function callBack;
  TempElevatedButton(
      {required this.data1,
      required this.data2,
      required this.buttonText,
      required this.colorData,
      required this.callBack});
  @override
  _TempElevatedButtonState createState() =>
      _TempElevatedButtonState(data1, data2, buttonText, colorData, callBack);
}

class _TempElevatedButtonState extends State<TempElevatedButton> {
  String buttonText;
  var data1, data2;
  Color colorData;
  Function callBack;
  _TempElevatedButtonState(
      this.data1, this.data2, this.buttonText, this.colorData, this.callBack);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(colorData),
            minimumSize:
                MaterialStateProperty.all<Size>(Size(double.infinity, 40))),
        onPressed: () {
          callBack(data1, data2);
        },
        child: Text(buttonText));
  }
}
