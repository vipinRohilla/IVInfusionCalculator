import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/formulas.dart/allFormulas.dart';
import 'package:flutter_application_2/widgets/buttonStyle.dart';
import 'package:flutter_application_2/widgets/elevatedButton.dart';

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

  var requiredDosage = 0.0;
  var ivBagVolume = 0.0;
  var doseInIvBag = 0.0;
  var total = 0.0;

  final requiredDosageCon = new TextEditingController();
  final ivBagVolumeCon = new TextEditingController();
  final doseInIvBagCon = new TextEditingController();

  void numClick(String requiredDosage, String ivBagVolume, String doseInIvBag) {
    setState(() {
      total = getInfusionByDose(requiredDosage, ivBagVolume, doseInIvBag);
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
                getTextFromTextField(
                    "Enter Value",
                    "Required Dose",
                    unitsForRequiredDosage,
                    currentItemForRequiredDosage,
                    requiredDosageCon),
              ],
            ),
            SizedBox(height: 20.0),
            Column(
              children: [
                SizedBox(height: 10.0),
                getTextFromTextField(
                    "Enter Value",
                    "IV Bag Volume",
                    unitsForIvBagVolume,
                    currentItemForIvBagVolume,
                    ivBagVolumeCon),
              ],
            ),
            SizedBox(height: 20.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10.0),
                getTextFromTextField("Enter Value", "Dose in IV Bag",
                    unitsForDoseIvBag, currentItemForDoseIvBag, doseInIvBagCon)
              ],
            ),
            SizedBox(height: 20.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      numClick(requiredDosageCon.text, ivBagVolumeCon.text,
                          doseInIvBagCon.text);
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
