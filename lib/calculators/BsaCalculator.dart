import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/formulas.dart/allFormulas.dart';
import 'package:flutter_application_2/widgets/buttonStyle.dart';
import '../widgets/getTextFromField.dart';

// ignore: must_be_immutable
class BsaCalculator extends StatefulWidget {
  @override
  _BsaCalculatorState createState() => _BsaCalculatorState();
}

class _BsaCalculatorState extends State<BsaCalculator> {
  List<String> unitsForWeight = ["Kg", "lb"];
  String currentItemForWeight = "Kg";

  List<String> unitsForHeight = ["cm", "inches"];
  String currentItemForHeight = "cm";

  var weight = 0.0;
  var height = 0.0;
  var total = 0.0;

  final weightCon = new TextEditingController();
  final heightCon = new TextEditingController();

  void numClick(String weight, String height) {
    setState(() {
      if (currentItemForWeight == "Kg") {
        total = getBSA(weight, height);
        switch (currentItemForHeight) {
          case "cm":
            {
              total = total;
              total = double.parse(total.toStringAsFixed(2));
            }

            break;
          case "inches":
            {
              total = total / sqrt(0.394);
              total = double.parse(total.toStringAsFixed(2));
            }
        }
      } else if (currentItemForWeight == "lb") {
        total = getBSA(weight, height);
        total = total / sqrt(2.2046);
        switch (currentItemForHeight) {
          case "cm":
            {
              total = total;
              total = double.parse(total.toStringAsFixed(2));
            }
            break;
          case "inches":
            {
              total = total / sqrt(0.394);
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
              "Calulate  the BSA(Body Surface Area)",
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
                    child: getTextFromTextField("Enter Value", "Weight",
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
                          if (weightCon.text != "" && heightCon.text != "") {
                            numClick(weightCon.text, heightCon.text);
                          }
                        },
                        value: currentItemForWeight),
                  ),
                )
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Flexible(
                    child: getTextFromTextField("Enter Value", "Height",
                        unitsForHeight, currentItemForHeight, heightCon)),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        iconSize: 30.0,
                        iconEnabledColor: Colors.blue,
                        items: unitsForHeight.map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            this.currentItemForHeight = newValue.toString();
                          });
                          if (weightCon.text != "" && heightCon.text != "") {
                            numClick(weightCon.text, heightCon.text);
                          }
                        },
                        value: currentItemForHeight),
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
                      Text("$total m^2 ",
                          style: TextStyle(
                              // fontFeatures: [FontFeature.superscripts()],
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
                      numClick(weightCon.text, heightCon.text);
                    },
                    style: getButtonStyle(Colors.blueGrey.shade800),
                    child: Text("Calculate")),
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        weightCon.text = "";
                        heightCon.text = "";
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
