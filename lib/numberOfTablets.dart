import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/elevatedButton.dart';
import 'package:flutter_application_2/resultBox.dart';
import 'getTextFromField.dart';

class NumberOfTablets extends StatelessWidget {
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
              "Calulate  Number of Tablets",
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
                getTextFromTextField(
                    "Enter Required Dosage", "Required Dosage", "mg"),
              ],
            ),
            SizedBox(height: 20.0),
            Column(
              children: [
                SizedBox(height: 10.0),
                getTextFromTextField(
                    "Enter Stock Strength", "Stock Strength", "mg"),
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
