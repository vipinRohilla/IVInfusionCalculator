import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/widgets/elevatedButton.dart';
import 'package:flutter_application_2/widgets/resultBox.dart';
import '../widgets/getTextFromField.dart';

class ChildDose extends StatefulWidget {
  @override
  _ChildDoseState createState() => _ChildDoseState();
}

class _ChildDoseState extends State<ChildDose> {
  List<String> unitsForChildWeight = ["mg", "g", "Kg"];
  String currentItemForChildWeight = "mg";

  List<String> unitsForAverageAdultDose = ["mg", "g", "Kg"];
  String currentItemForAverageAdultDose = "mg";

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
              "Calulate  Child Dose",
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
                getTextFromTextField("Enter Value", "Child Weight",
                    unitsForChildWeight, currentItemForChildWeight),
              ],
            ),
            SizedBox(height: 20.0),
            Column(
              children: [
                SizedBox(height: 10.0),
                getTextFromTextField("Enter Value", "Average Adult Dose",
                    unitsForAverageAdultDose, currentItemForAverageAdultDose),
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
