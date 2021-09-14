import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/widgets/elevatedButton.dart';
import 'package:flutter_application_2/widgets/resultBox.dart';

import '../widgets/getTextFromField.dart';

class IvDropRate extends StatefulWidget {
  @override
  _IvDropRateState createState() => _IvDropRateState();
}

class _IvDropRateState extends State<IvDropRate> {
  List<String> unitsForRequiredDosage = [
    "mL",
    "L",
  ];
  String currentItemForRequiredDosage = "mL";

  List<String> unitsForTime = ["hr", "min", "sec"];
  String currentItemForTime = "hr";

  List<String> unitsForDropFactor = [
    "(drops/mL)/60(min/hr)",
    "(drops/L)/60(min/hr)"
  ];
  String currentItemForDropFactor = "(drops/mL)/60(min/hr)";

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
              "Calulate  IV Drop Rate",
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
                getTextFromTextField("Enter Value", "Required Dose",
                    unitsForRequiredDosage, currentItemForRequiredDosage),
              ],
            ),
            SizedBox(height: 20.0),
            Column(
              children: [
                SizedBox(height: 10.0),
                getTextFromTextField(
                    "Enter Value", "Time", unitsForTime, currentItemForTime),
              ],
            ),
            SizedBox(height: 20.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10.0),
                getTextFromTextField("Enter Value", "Drop Factor",
                    unitsForDropFactor, currentItemForDropFactor),
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
