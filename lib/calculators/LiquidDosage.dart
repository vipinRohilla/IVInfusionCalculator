import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/formulas.dart/allFormulas.dart';
import 'package:flutter_application_2/widgets/buttonStyle.dart';

import '../widgets/getTextFromField.dart';

class LiquidDosage extends StatefulWidget {
  @override
  _LiquidDosageState createState() => _LiquidDosageState();
}

class _LiquidDosageState extends State<LiquidDosage> {
  List<String> unitsForRequiredDosage = [
    "ml/Kg",
    "L /kg",
  ];
  String currentItemForRequiredDosage = "ml/Kg";

  List<String> unitsForWeight = ["Kg", "lb"];
  String currentItemForWeight = "Kg";

  var requiredDosage = 0.0;
  var weight = 0.0;
  var total = 0.0;
  String currentItemForRequiredDosagePerUnit = "ml";

  final requiredDosageCon = new TextEditingController();
  final weightCon = new TextEditingController();

  void numClick(String requiredDosage, String weight) {
    setState(() {
      total = getLiquidDosage(requiredDosage, weight);
      if (currentItemForRequiredDosage == "ml/Kg") {
        switch (currentItemForWeight) {
          case "Kg":
            {
              total = total;
              total = double.parse(total.toStringAsFixed(2));
            }

            break;
          case "lb":
            {
              total = total * 2.2046;
              total = double.parse(total.toStringAsFixed(2));
            }
        }
      } else if (currentItemForRequiredDosage == "L /kg") {
        total = total * 1000;
        switch (currentItemForWeight) {
          case "Kg":
            {
              total = total;
              total = double.parse(total.toStringAsFixed(2));
            }
            break;
          case "lb":
            {
              total = total * 2.2046;
              total = double.parse(total.toStringAsFixed(2));
            }
            break;
        }
      }
      currentItemForRequiredDosagePerUnit =
          currentItemForRequiredDosage.substring(0, 2);
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
              "Calulate  Doses by Body Weight",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 19.0),
            Row(
              children: [
                Flexible(
                    child: getTextFromTextField(
                        "Enter Value",
                        "Required Dosage",
                        unitsForRequiredDosage,
                        currentItemForRequiredDosage,
                        requiredDosageCon)),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        iconSize: 30.0,
                        iconEnabledColor: Colors.blue,
                        items: unitsForRequiredDosage
                            .map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            this.currentItemForRequiredDosage =
                                newValue.toString();
                          });
                          if (requiredDosageCon.text != "" &&
                              weightCon.text != "") {
                            numClick(requiredDosageCon.text, weightCon.text);
                          }
                        },
                        value: currentItemForRequiredDosage),
                  ),
                )
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                SizedBox(height: 10.0),
                Flexible(
                    child: getTextFromTextField("Enter Value", "Body Weight",
                        unitsForWeight, currentItemForWeight, weightCon)),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        iconSize: 30.0,
                        iconEnabledColor: Colors.blue,
                        items: unitsForWeight.map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            this.currentItemForWeight = newValue.toString();
                          });
                          if (requiredDosageCon.text != "" &&
                              weightCon.text != "") {
                            numClick(requiredDosageCon.text, weightCon.text);
                          }
                        },
                        value: currentItemForWeight),
                  ),
                )
              ],
            ),
            SizedBox(height: 10.0),
            SizedBox(
              height: 100,
              child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.cyan[900]),
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
                      Text("$total $currentItemForRequiredDosagePerUnit",
                          style: TextStyle(
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))
                    ],
                  )),
            ),
            SizedBox(height: 10.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      numClick(requiredDosageCon.text, weightCon.text);
                    },
                    style: getButtonStyle(Colors.blueGrey.shade800),
                    child: Text("Calculate")),
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        weightCon.text = "";
                        requiredDosageCon.text = "";
                        total = 0.0;
                      });
                    },
                    style: getButtonStyle(Colors.red.shade600),
                    child: Text("Clear")),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    ]);
  }
}
