import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/formulas.dart/allFormulas.dart';
import 'package:flutter_application_2/widgets/buttonStyle.dart';
import 'package:flutter_application_2/widgets/elevatedButton.dart';

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

  var stockStrength = 0.0;
  var stockVolume = 0.0;
  var requiredDosage = 0.0;
  var weight = 0.0;
  var total = 0.0;

  final stockStrengthCon = new TextEditingController();
  final stockVolumeCon = new TextEditingController();
  final requiredDosageCon = new TextEditingController();
  final weightCon = new TextEditingController();

  void numClick(String stockStrength, String stockVolume, String requiredDosage,
      String weight) {
    setState(() {
      total = getDose(stockStrength, stockVolume, requiredDosage, weight);
    });
  }

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
                getTextFromTextField(
                    "Enter Value",
                    "Stock Strength",
                    unitsForStockStrength,
                    currentItemForStockStrength,
                    stockStrengthCon),
              ],
            ),
            SizedBox(height: 20.0),
            Column(
              children: [
                SizedBox(height: 10.0),
                getTextFromTextField(
                    "Enter Value",
                    "Stock Volume",
                    unitsForStockVolume,
                    currentItemForStockVolume,
                    stockVolumeCon),
              ],
            ),
            SizedBox(height: 20.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10.0),
                getTextFromTextField(
                    "Enter Value",
                    "Required Dosage",
                    unitsForRequiredDosage,
                    currentItemForRequiredDosage,
                    requiredDosageCon)
              ],
            ),
            SizedBox(height: 20.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10.0),
                getTextFromTextField("Enter Value", "Body Weight",
                    unitsForBodyWeight, currentItemForBodyWeight, weightCon)
              ],
            ),
            SizedBox(height: 20.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      numClick(stockStrengthCon.text, stockVolumeCon.text,
                          requiredDosageCon.text, weightCon.text);
                    },
                    style: getButtonStyle(Colors.green),
                    child: Text("Calculate")),
                SizedBox(height: 10),
                GetElevatedButton(buttonText: "Clear", colorData: Colors.red),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.green[600]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Result : ",
                          style: TextStyle(
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      SizedBox(height: 10.0),
                      Text("$total",
                          style: TextStyle(
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))
                    ],
                  )),
            )
          ],
        ),
      ),
    ]);
  }
}
