import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/formulas.dart/allFormulas.dart';
import 'package:flutter_application_2/widgets/buttonStyle.dart';
import 'package:flutter_application_2/styling/size_config.dart';
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
  double myFontSize = 1.9 * SizeConfig.textMultiplier;

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

  Widget _landScapeMode(){
    return GridView.count(
      crossAxisCount: 2,
               childAspectRatio: 3,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                      child: getTextFromTextField("Enter Value", "Weight",
                          unitsForWeight, currentItemForWeight, weightCon)),
                Container(
                 
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
                )],
            ),
                    ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      child: getTextFromTextField("Enter Value", "Height",
                          unitsForHeight, currentItemForHeight, heightCon)),
                  Container(
                   
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
                  )],
              ),
            ),
              ]
      ) ;
  }
  Widget _portraitMode(){
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    child: getTextFromTextField("Enter Value", "Weight",
                        unitsForWeight, currentItemForWeight, weightCon)),
                Container(
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
                )],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    child: getTextFromTextField("Enter Value", "Height",
                        unitsForHeight, currentItemForHeight, heightCon)),
                Container(
                 
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
                )],
            ),
    ],);
  }

  @override
  Widget build(BuildContext context) {
     double _width = MediaQuery.of(context).size.width;
     
    return 
    // ListView(children: [
    //   Container(
    //     height: 550,
    //     color: Colors.blue[50],
    //     child: 
        ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          children: [
            Text(
              "Calulate  the BSA(Body Surface Area)",
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
                      Text("$total m^2 ",
                          style: TextStyle(
                              // fontFeatures: [FontFeature.superscripts()],
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
                      numClick(weightCon.text, heightCon.text);
                    },
                    style: getButtonStyle(Colors.blueGrey.shade800),
                    child: Text("Calculate", style: TextStyle(fontSize : myFontSize))),
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
