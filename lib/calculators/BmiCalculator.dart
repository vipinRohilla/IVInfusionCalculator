import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/formulas.dart/allFormulas.dart';
import 'package:flutter_application_2/widgets/buttonStyle.dart';
import '../widgets/getTextFromField.dart';

class BmiCalculator extends StatefulWidget {
  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  List<String> unitsOfWeight = ["Kg", "lb"];
  List<String> unitsOfHeight = ["m", "cm", "inches", "ft"];

  String currentItemOfWeight = "Kg";
  String currentItemOfHeight = "m";

  var weight = 0.0;
  var height = 0.0;
  var total = 0.0;
  final weightCon = new TextEditingController();
  final heightCon = new TextEditingController();

  void numClick(String weight, String height) {
    setState(() {
      if (currentItemOfWeight == "Kg") {
        total = getBMI(weight, height);
        switch (currentItemOfHeight) {
          case "m":
            {
              total = total;
              total = double.parse(total.toStringAsFixed(2));
            }
            break;
          case "cm":
            {
              total = total * 10000;
              total = double.parse(total.toStringAsFixed(2));
            }

            break;
          case "inches":
            {
              total = total * pow(39.37, 2);
              total = double.parse(total.toStringAsFixed(2));
            }

            break;
          case "ft":
            {
              total = total * pow(3.28084, 2);
              total = double.parse(total.toStringAsFixed(2));
            }
            break;
        }
      } else if (currentItemOfWeight == "lb") {
        total = getBMI(weight, height);
        switch (currentItemOfHeight) {
          case "m":
            {
              total = total / 2.2046;
              total = double.parse(total.toStringAsFixed(2));
            }
            break;
          case "cm":
            {
              total = (total * 10000) / 2.2046;
              total = double.parse(total.toStringAsFixed(2));
            }

            break;
          case "inches":
            {
              total = (total * pow(39.37, 2)) / 2.2046;
              total = double.parse(total.toStringAsFixed(2));
            }

            break;
          case "ft":
            {
              total = (total * pow(3.28084, 2)) / 2.2046;
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
              "Calulate  the BMI(Body Mass Index)",
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
                        unitsOfWeight, currentItemOfWeight, weightCon)),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      iconSize: 30.0,
                      iconEnabledColor: Colors.blue,
                      items: unitsOfWeight.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          this.currentItemOfWeight = newValue.toString();
                        });
                        if (weightCon.text != "" && heightCon.text != "") {
                          numClick(weightCon.text, heightCon.text);
                        }
                      },
                      value: currentItemOfWeight,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Flexible(
                    child: getTextFromTextField("Enter Value", "Height",
                        unitsOfHeight, currentItemOfHeight, heightCon)),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        iconSize: 30.0,
                        iconEnabledColor: Colors.blue,
                        items: unitsOfHeight.map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            this.currentItemOfHeight = newValue.toString();
                          });
                          if (weightCon.text != "" && heightCon.text != "") {
                            numClick(weightCon.text, heightCon.text);
                          }
                        },
                        value: currentItemOfHeight),
                  ),
                )
              ],
            ),
            SizedBox(height: 20.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      if (weightCon.text != "" && heightCon.text != "") {
                        numClick(weightCon.text, heightCon.text);
                      }
                    },
                    style: getButtonStyle(Colors.green),
                    child: Text("Calculate")),
                SizedBox(height: 10),
                // GetElevatedButton(buttonText: "Clear", colorData: Colors.red),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        weightCon.text = "";
                        heightCon.text = "";
                        total = 0.0;
                      });
                    },
                    style: getButtonStyle(Colors.red),
                    child: Text("Clear"))
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
