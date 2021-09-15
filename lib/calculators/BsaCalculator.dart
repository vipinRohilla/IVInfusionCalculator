import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/formulas.dart/allFormulas.dart';
import 'package:flutter_application_2/widgets/buttonStyle.dart';
import 'package:flutter_application_2/widgets/elevatedButton.dart';

import '../widgets/getTextFromField.dart';

// ignore: must_be_immutable
class BsaCalculator extends StatefulWidget {
  @override
  _BsaCalculatorState createState() => _BsaCalculatorState();
}

class _BsaCalculatorState extends State<BsaCalculator> {
  List<String> unitsForHeight = ["m", "cm", "inches"];
  List<String> unitsForWeight = ["Kg", "g"];

  String currentItemForHeight = "m";
  String currentItemForWeight = "Kg";

  var weight = 0.0;
  var height = 0.0;
  var total = 0.0;

  final weightCon = new TextEditingController();
  final heightCon = new TextEditingController();

  void numClick(String weight, String height) {
    setState(() {
      total = getBSA(weight, height);
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
            Column(
              children: [
                SizedBox(height: 10.0),
                getTextFromTextField("Enter Value", "Weight", unitsForWeight,
                    currentItemForWeight, weightCon)
              ],
            ),
            SizedBox(height: 20.0),
            Column(
              children: [
                SizedBox(height: 10.0),
                getTextFromTextField("Enter Value", "Height", unitsForHeight,
                    currentItemForHeight, heightCon),
              ],
            ),
            SizedBox(height: 20.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      numClick(weightCon.text, heightCon.text);
                    },
                    style: getButtonStyle(),
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
