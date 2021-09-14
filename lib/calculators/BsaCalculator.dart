import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/widgets/elevatedButton.dart';
import 'package:flutter_application_2/widgets/resultBox.dart';
import '../widgets/getTextFromField.dart';

// ignore: must_be_immutable
class BsaCalculator extends StatefulWidget {
  @override
  _BsaCalculatorState createState() => _BsaCalculatorState();
}

class _BsaCalculatorState extends State<BsaCalculator> {
  List<String> unitsForHeight = ["m", "cm", "inches"];

  List<String> unitsForWeight = ["Kg", "g"];

  String currentItemForHeight = "m";

  String currentItemForWeight = "Kg";

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        height: 550,
        color: Colors.blue[50],
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          children: [
            Text(
              "Calulate  the BSA(Body Surface Area)",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 19.0),
            Column(
              children: [
                SizedBox(height: 10.0),
                getTextFromTextField("Enter Value", "Weight", unitsForWeight,
                    currentItemForWeight)
              ],
            ),
            SizedBox(height: 20.0),
            Column(
              children: [
                SizedBox(height: 10.0),
                getTextFromTextField("Enter Value", "Height", unitsForHeight,
                    currentItemForHeight),
              ],
            ),
            SizedBox(height: 20.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                getElevatedButton("Calculate", Colors.blue),
                SizedBox(height: 10),
                getElevatedButton("Clear", Colors.red),
              ],
            ),
            SizedBox(height: 10),
            getResultBox()
          ],
        ),
      ),
    ]);
  }
}
