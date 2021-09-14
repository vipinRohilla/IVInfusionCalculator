import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/widgets/elevatedButton.dart';
import 'package:flutter_application_2/widgets/resultBox.dart';

import '../widgets/getTextFromField.dart';

class VolumeInLiquid extends StatefulWidget {
  @override
  _VolumeInLiquidState createState() => _VolumeInLiquidState();
}

class _VolumeInLiquidState extends State<VolumeInLiquid> {
  List<String> unitsForStockVolume = [
    "mL",
    "L",
  ];
  String currentItemForStockVolume = "mL";

  List<String> unitsForRequiredDosage = ["mg", "g", "Kg"];
  String currentItemForRequiredDosage = "mg";

  List<String> unitsForStocksStrength = ["mg", "g", "Kg"];
  String currentItemForStocksStrength = "mg";

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
              "Calulate  the  total volume  in Liquid",
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
                getTextFromTextField("Enter Value", "Stock Volume",
                    unitsForStockVolume, currentItemForStockVolume),
              ],
            ),
            SizedBox(height: 20.0),
            Column(
              children: [
                SizedBox(height: 10.0),
                getTextFromTextField("Enter Value", "Required Dosage",
                    unitsForRequiredDosage, currentItemForRequiredDosage),
              ],
            ),
            SizedBox(height: 20.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10.0),
                getTextFromTextField("Enter Value", "Stock Strength",
                    unitsForStocksStrength, currentItemForStocksStrength),
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
