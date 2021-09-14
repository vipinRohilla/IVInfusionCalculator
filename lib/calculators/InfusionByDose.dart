import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/widgets/elevatedButton.dart';
import 'package:flutter_application_2/widgets/resultBox.dart';

import '../widgets/getTextFromField.dart';

class InfusionByDose extends StatefulWidget {
  @override
  _InfusionByDoseState createState() => _InfusionByDoseState();
}

class _InfusionByDoseState extends State<InfusionByDose> {
  List<String> unitsForRequiredDosage = ["mg/hour", "mg/minutes", "mg/second"];
  String currentItemForRequiredDosage = "mg/hour";

  List<String> unitsForIvBagVolume = ["ml", "L"];
  String currentItemForIvBagVolume = "ml";

  List<String> unitsForDoseIvBag = ["mg", "g", "Kg"];
  String currentItemForDoseIvBag = "mg";

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
              "Calulate  the  total volume  of  fluid  in a given  time",
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
                getTextFromTextField("Enter Value", "IV Bag Volume",
                    unitsForIvBagVolume, currentItemForIvBagVolume),
              ],
            ),
            SizedBox(height: 20.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10.0),
                getTextFromTextField("Enter Value", "Dose in IV Bag",
                    unitsForDoseIvBag, currentItemForDoseIvBag)
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
