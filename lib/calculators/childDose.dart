import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/formulas.dart/allFormulas.dart';
import 'package:flutter_application_2/widgets/buttonStyle.dart';

import '../widgets/getTextFromField.dart';

class ChildDose extends StatefulWidget {
  @override
  _ChildDoseState createState() => _ChildDoseState();
}

class _ChildDoseState extends State<ChildDose> {
  List<String> unitsForChildWeight = ["Kg", "lb"];
  String currentItemForChildWeight = "Kg";

  List<String> unitsForAverageAdultDose = ["mg", "g"];
  String currentItemForAverageAdultDose = "mg";

  var weight = 0.0;
  var adultDose = 0.0;
  var total = 0.0;

  final weightCon = new TextEditingController();
  final adultDoseCon = new TextEditingController();
  void numClick(String weight, String adultDose) {
    setState(() {
      total = getChildDose(weight, adultDose);
      if (currentItemForChildWeight == "Kg") {
        switch (currentItemForAverageAdultDose) {
          case "mg":
            {
              total = total;
              total = double.parse(total.toStringAsFixed(2));
            }

            break;
          case "g":
            {
              total = total * 1000;
              total = double.parse(total.toStringAsFixed(2));
            }
        }
      } else if (currentItemForChildWeight == "lb") {
        total = total / 2.2046;
        switch (currentItemForAverageAdultDose) {
          case "mg":
            {
              total = total;
              total = double.parse(total.toStringAsFixed(2));
            }
            break;
          case "g":
            {
              total = total * 1000;
              total = double.parse(total.toStringAsFixed(2));
            }
            break;
        }
      }
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
              "Calulate  Child Dose",
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
                        "Child Weight",
                        unitsForChildWeight,
                        currentItemForChildWeight,
                        weightCon)),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        iconSize: 30.0,
                        iconEnabledColor: Colors.blue,
                        items: unitsForChildWeight
                            .map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            this.currentItemForChildWeight =
                                newValue.toString();
                          });
                          if (weightCon.text != "" && adultDoseCon.text != "") {
                            numClick(weightCon.text, adultDoseCon.text);
                          }
                        },
                        value: currentItemForChildWeight),
                  ),
                )
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Flexible(
                    child: getTextFromTextField(
                        "Enter Value",
                        "Average Adult Dose",
                        unitsForAverageAdultDose,
                        currentItemForAverageAdultDose,
                        adultDoseCon)),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        iconSize: 30.0,
                        iconEnabledColor: Colors.blue,
                        items: unitsForAverageAdultDose
                            .map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            this.currentItemForAverageAdultDose =
                                newValue.toString();
                          });
                          if (weightCon.text != "" && adultDoseCon.text != "") {
                            numClick(weightCon.text, adultDoseCon.text);
                          }
                        },
                        value: currentItemForAverageAdultDose),
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
                      Text("$total $currentItemForAverageAdultDose",
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
                      numClick(weightCon.text, adultDoseCon.text);
                    },
                    style: getButtonStyle(Colors.blueGrey.shade800),
                    child: Text("Calculate")),
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        weightCon.text = "";
                        adultDoseCon.text = "";
                        total = 0.0;
                      });
                    },
                    style: getButtonStyle(Colors.red.shade600),
                    child: Text("Clear"))
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    ]);
  }
}
