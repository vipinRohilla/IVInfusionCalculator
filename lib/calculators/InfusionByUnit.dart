import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/formulas.dart/allFormulas.dart';
import 'package:flutter_application_2/widgets/buttonStyle.dart';
import 'package:flutter_application_2/widgets/elevatedButton.dart';

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

  var requiredDosage = 0.0;
  var ivBagVolume = 0.0;
  var unitInIvBag = 0.0;
  var total = 0.0;
  String currentItemForRequireDosageLastPerUnit = "hour";

  final requiredDosageCon = new TextEditingController();
  final ivBagVolumeCon = new TextEditingController();
  final unitInIvBagCon = new TextEditingController();

  void numClick(String requiredDosage, String ivBagVolume, String unitInIvBag) {
    setState(() {
      total = getInfusionByUnit(requiredDosage, ivBagVolume, unitInIvBag);
      if (currentItemForRequiredDosage == "unit/hour") {
        total = getInfusionByUnit(requiredDosage, ivBagVolume, unitInIvBag);
        switch (currentItemForIvBagVolume) {
          case "ml":
            {
              total = total;
              total = double.parse(total.toStringAsFixed(2));
            }

            break;
          case "L":
            {
              total = total * 1000;
              total = double.parse(total.toStringAsFixed(2));
            }
        }
      } else if (currentItemForRequiredDosage == "unit/minute") {
        total = getInfusionByUnit(requiredDosage, ivBagVolume, unitInIvBag);
        total = total * 60;
        switch (currentItemForIvBagVolume) {
          case "ml":
            {
              total = total;
              total = double.parse(total.toStringAsFixed(2));
            }
            break;
          case "L":
            {
              total = total * 1000;
              total = double.parse(total.toStringAsFixed(2));
            }
            break;
        }
      } else if (currentItemForRequiredDosage == "unit/second") {
        total = getInfusionByUnit(requiredDosage, ivBagVolume, unitInIvBag);
        total = total * 3600;
        switch (currentItemForIvBagVolume) {
          case "ml":
            {
              total = total;
              total = double.parse(total.toStringAsFixed(2));
            }
            break;
          case "L":
            {
              total = total * 1000;
              total = double.parse(total.toStringAsFixed(2));
            }
            break;
        }
      }
      currentItemForRequireDosageLastPerUnit =
          currentItemForRequiredDosage.substring(5);
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
              "Calulate  infusion  drop  rate  per  minute, flow rate,  and  drop  interval",
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
                        "Required Dose",
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
                              ivBagVolumeCon.text != "" &&
                              unitInIvBagCon.text != "") {
                            numClick(requiredDosageCon.text,
                                ivBagVolumeCon.text, unitInIvBagCon.text);
                          }
                        },
                        value: currentItemForRequiredDosage),
                  ),
                )
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Flexible(
                    child: getTextFromTextField(
                        "Enter Value",
                        "IV Bag Volume",
                        unitsForIvBagVolume,
                        currentItemForIvBagVolume,
                        ivBagVolumeCon)),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        iconSize: 30.0,
                        iconEnabledColor: Colors.blue,
                        items: unitsForIvBagVolume
                            .map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            this.currentItemForIvBagVolume =
                                newValue.toString();
                          });
                          if (requiredDosageCon.text != "" &&
                              ivBagVolumeCon.text != "" &&
                              unitInIvBagCon.text != "") {
                            numClick(requiredDosageCon.text,
                                ivBagVolumeCon.text, unitInIvBagCon.text);
                          }
                        },
                        value: currentItemForIvBagVolume),
                  ),
                )
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                    child: getTextFromTextField(
                        "Enter Value",
                        "unit in IV Bag",
                        unitsForDoseIvBag,
                        currentItemForDoseIvBag,
                        unitInIvBagCon)),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        iconSize: 30.0,
                        iconEnabledColor: Colors.blue,
                        items:
                            unitsForDoseIvBag.map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            this.currentItemForDoseIvBag = newValue.toString();
                          });
                          if (requiredDosageCon.text != "" &&
                              ivBagVolumeCon.text != "" &&
                              unitInIvBagCon.text != "") {
                            numClick(requiredDosageCon.text,
                                ivBagVolumeCon.text, unitInIvBagCon.text);
                          }
                        },
                        value: currentItemForDoseIvBag),
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
                      numClick(requiredDosageCon.text, ivBagVolumeCon.text,
                          unitInIvBagCon.text);
                    },
                    style: getButtonStyle(Colors.green),
                    child: Text("Calculate")),
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        ivBagVolumeCon.text = "";
                        unitInIvBagCon.text = "";
                        requiredDosageCon.text = "";
                        total = 0.0;
                      });
                    },
                    style: getButtonStyle(Colors.red),
                    child: Text("Clear")),
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
                      Text(
                          "$total $currentItemForIvBagVolume / $currentItemForRequireDosageLastPerUnit ",
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
