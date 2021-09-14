import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/widgets/elevatedButton.dart';
import 'package:flutter_application_2/widgets/resultBox.dart';
import '../widgets/getTextFromField.dart';

class InfusionByUnit extends StatefulWidget {
  @override
  _InfusionByUnitState createState() => _InfusionByUnitState();
}

class _InfusionByUnitState extends State<InfusionByUnit> {
  List<String> unitsForRequiredDosage = [
    "unit/hour",
    "unit/minutes",
    "unit/second"
  ];
  String currentItemForRequiredDosage = "unit/hour";

  List<String> unitsForIvBagVolume = ["ml", "L"];
  String currentItemForIvBagVolume = "ml";

  List<String> unitsForDoseIvBag = ["unit"];
  String currentItemForDoseIvBag = "unit";

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
              "Calulate  infusion  drop  rate  per  minute, flow rate,  and  drop  interval",
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
                getTextFromTextField("Enter Value", "unit in IV Bag",
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
