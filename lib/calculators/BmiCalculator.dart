import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/formulas.dart/allFormulas.dart';
import 'package:flutter_application_2/styling/size_config.dart';
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
  double myFontSize = 2 * SizeConfig.textMultiplier;

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

  Widget _landScapeMode(){
    return GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 4,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    child: getTextFromTextField("Enter Value", "Weight",
                        unitsOfWeight, currentItemOfWeight, weightCon)),
                Container(
                height: 59,
                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                padding: EdgeInsets.fromLTRB(10,0,0,0),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  border: Border(
                    left: BorderSide.none,
                    top : BorderSide(color: Colors.blue.shade400, width: 1.5),
                    right: BorderSide(color: Colors.blue.shade400, width: 1.5),
                    bottom: BorderSide(color: Colors.blue.shade400, width: 1.5),
                   )

                  ),
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
                )],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    child: getTextFromTextField("Enter Value", "Height",
                        unitsOfHeight, currentItemOfHeight, heightCon)),
                Container(
                height: 59,
                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                padding: EdgeInsets.fromLTRB(10,0,0,0),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  border: Border(
                    left: BorderSide.none,
                    top : BorderSide(color: Colors.blue.shade400, width: 1.5),
                    right: BorderSide(color: Colors.blue.shade400, width: 1.5),
                    bottom: BorderSide(color: Colors.blue.shade400, width: 1.5),
                   )

                  ),
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
                )],
            ),
              ]);
  }
  Widget _portraitMode(){
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    child: getTextFromTextField("Enter Value", "Weight",
                        unitsOfWeight, currentItemOfWeight, weightCon)),
                Container(
                height: 59,
                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                padding: EdgeInsets.fromLTRB(10,0,0,0),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  border: Border(
                    left: BorderSide.none,
                    top : BorderSide(color: Colors.blue.shade400, width: 1.5),
                    right: BorderSide(color: Colors.blue.shade400, width: 1.5),
                    bottom: BorderSide(color: Colors.blue.shade400, width: 1.5),
                   )

                  ),
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
                )],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    child: getTextFromTextField("Enter Value", "Height",
                        unitsOfHeight, currentItemOfHeight, heightCon)),
                Container(
                height: 59,
                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                padding: EdgeInsets.fromLTRB(10,0,0,0),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  border: Border(
                    left: BorderSide.none,
                    top : BorderSide(color: Colors.blue.shade400, width: 1.5),
                    right: BorderSide(color: Colors.blue.shade400, width: 1.5),
                    bottom: BorderSide(color: Colors.blue.shade400, width: 1.5),
                   )

                  ),
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
                )],
            ),
    ],);
  }
  @override
  Widget build(BuildContext context) {
     double _width = MediaQuery.of(context).size.width;
     
    return 
    //ListView(children: [
    //   Container(
    //     height: 550,
    //     color: Colors.blue[50],
    //     child: 
    ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          children: [
            Text(
              "Calulate  the BMI(Body Mass Index)",
              style: TextStyle(
                fontSize: myFontSize,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 19.0),
            (_width > 500) ? _landScapeMode() : _portraitMode(),
            SizedBox(height: 10.0),
            SizedBox(
              height: 120,
              child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color:
                          (total != 0.0) ? Colors.blue[400] : Colors.cyan[900]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Result : ",
                          style: TextStyle(
                              letterSpacing: 2,
fontSize: myFontSize,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                      SizedBox(height: 10.0),
                      Text("$total",
                          style: TextStyle(
                              letterSpacing: 2,
fontSize: myFontSize,
                              fontWeight: FontWeight.w500,
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
                      if (weightCon.text != "" && heightCon.text != "") {
                        numClick(weightCon.text, heightCon.text);
                      }
                    },
                    style: getButtonStyle(Colors.blueGrey.shade800),
                    child: Text("Calculate", style: TextStyle(fontSize : myFontSize))),
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
                    style: getButtonStyle(Colors.red.shade600),
                    child: Text("Clear", style: TextStyle(fontSize : myFontSize))),
              ],
            ),
            SizedBox(height: 10),
          ],
        );
      // ),
    // ]);
  }
}
