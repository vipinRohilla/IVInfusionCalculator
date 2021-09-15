import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/widgets/elevatedButton.dart';
import 'package:flutter_application_2/widgets/resultBox.dart';

import '../widgets/getTextFromField.dart';

class Dose extends StatefulWidget {
  @override
  _DoseState createState() => _DoseState();
}

class _DoseState extends State<Dose> {
  List<String> unitsForStockStrength = ["mg", "g", "Kg"];
  String currentItemForStockStrength = "mg";

  List<String> unitsForStockVolume = ["mL", "L"];
  String currentItemForStockVolume = "mL";

  List<String> unitsForRequiredDosage = ["mg/Kg", "g/Kg"];
  String currentItemForRequiredDosage = "mg/Kg";

  List<String> unitsForBodyWeight = ["Kg", "g"];
  String currentItemForBodyWeight = "Kg";

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
              "Calulate  the  Dose",
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
                getTextFromTextField("Enter Value", "Stock Strength",
                    unitsForStockStrength, currentItemForStockStrength),
              ],
            ),
            SizedBox(height: 20.0),
            Column(
              children: [
                SizedBox(height: 10.0),
                getTextFromTextField("Enter Value", "Stock Volume",
                    unitsForStockVolume, currentItemForStockVolume),
              ],
            ),
            SizedBox(height: 20.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10.0),
                getTextFromTextField("Enter Value", "Required Dosage",
                    unitsForRequiredDosage, currentItemForRequiredDosage)
              ],
            ),
            SizedBox(height: 20.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10.0),
                getTextFromTextField("Enter Value", "Body Weight",
                    unitsForBodyWeight, currentItemForBodyWeight)
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
