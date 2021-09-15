import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GetElevatedButton extends StatefulWidget {
  String buttonText;
  Color colorData;
  GetElevatedButton({required this.buttonText, required this.colorData});
  @override
  _GetElevatedButtonState createState() =>
      _GetElevatedButtonState(buttonText, colorData);
}

class _GetElevatedButtonState extends State<GetElevatedButton> {
  String buttonText;
  Color colorData;
  _GetElevatedButtonState(this.buttonText, this.colorData);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(colorData),
            minimumSize:
                MaterialStateProperty.all<Size>(Size(double.infinity, 40))),
        onPressed: () {},
        child: Text(buttonText));
  }
}
