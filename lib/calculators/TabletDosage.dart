import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/widgets/elevatedButton.dart';
import 'package:flutter_application_2/widgets/resultBox.dart';
import '../widgets/getTextFromField.dart';

class TabletDosage extends StatefulWidget {
  @override
  _TabletDosageState createState() => _TabletDosageState();
}

class _TabletDosageState extends State<TabletDosage> {
  List<String> unitsForRequiredDosage = ["mg", "g", "Kg"];
  String currentItemForRequiredDosage = "mg";

  List<String> unitsForWeight = ["Kg", "g"];
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
              "Calulate  Doses by Body Weight",
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
                getTextFromTextField("Enter Value", "Required Dosage",
                    unitsForRequiredDosage, currentItemForRequiredDosage),
              ],
            ),
            SizedBox(height: 20.0),
            Column(
              children: [
                SizedBox(height: 10.0),
                getTextFromTextField("Enter Value", "Body Weight",
                    unitsForWeight, currentItemForWeight),
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
