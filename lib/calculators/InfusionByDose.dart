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
  List<String> unitsForRequiredDosage = ["mg/hour", "mg/minute", "mg/second"];
  String currentItemForRequiredDosage = "mg/hour";

  List<String> unitsForIvBagVolume = ["ml"];
  String currentItemForIvBagVolume = "ml";

  List<String> unitsForDoseIvBag = ["mg", "g"];
  String currentItemForDoseIvBag = "mg";

  var requiredDosage = 0.0;
  var ivBagVolume = 0.0;
  var doseInIvBag = 0.0;
  var total = 0.0;

  String currentItemForRequireDosageLastPerUnit = "hour";

  final requiredDosageCon = new TextEditingController();
  final ivBagVolumeCon = new TextEditingController();
  final doseInIvBagCon = new TextEditingController();

  void numClick(String requiredDosage, String ivBagVolume, String doseInIvBag) {
    setState(() {
      total = getInfusionByDose(requiredDosage, ivBagVolume, doseInIvBag);
      if (currentItemForRequiredDosage == "mg/hour") {
        total = getInfusionByDose(requiredDosage, ivBagVolume, doseInIvBag);
        switch (currentItemForDoseIvBag) {
          case "mg":
            {
              total = total;
              total = double.parse(total.toStringAsFixed(2));
            }

            break;
          case "g":
            {
              total = total / 1000;
              total = double.parse(total.toStringAsFixed(2));
            }
        }
      } else if (currentItemForRequiredDosage == "mg/minute") {
        total = getInfusionByDose(requiredDosage, ivBagVolume, doseInIvBag);
        total = total * 60;
        switch (currentItemForDoseIvBag) {
          case "mg":
            {
              total = total;
              total = double.parse(total.toStringAsFixed(2));
            }
            break;
          case "g":
            {
              total = total / 1000;
              total = double.parse(total.toStringAsFixed(2));
            }
            break;
        }
      } else if (currentItemForRequiredDosage == "mg/second") {
        total = getInfusionByDose(requiredDosage, ivBagVolume, doseInIvBag);
        total = total * 3600;
        switch (currentItemForDoseIvBag) {
          case "mg":
            {
              total = total;
              total = double.parse(total.toStringAsFixed(2));
            }
            break;
          case "g":
            {
              total = total / 1000;
              total = double.parse(total.toStringAsFixed(2));
            }
            break;
        }
      }
      currentItemForRequireDosageLastPerUnit =
          currentItemForRequiredDosage.substring(3);
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
                              doseInIvBagCon.text != "") {
                            numClick(requiredDosageCon.text,
                                ivBagVolumeCon.text, doseInIvBagCon.text);
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
                              doseInIvBagCon.text != "") {
                            numClick(requiredDosageCon.text,
                                ivBagVolumeCon.text, doseInIvBagCon.text);
                          }
                        },
                        value: currentItemForIvBagVolume),
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
                        "Dose in IV Bag",
                        unitsForDoseIvBag,
                        currentItemForDoseIvBag,
                        doseInIvBagCon)),
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
                              doseInIvBagCon.text != "") {
                            numClick(requiredDosageCon.text,
                                ivBagVolumeCon.text, doseInIvBagCon.text);
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
                          doseInIvBagCon.text);
                    },
                    style: getButtonStyle(Colors.green),
                    child: Text("Calculate")),
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        ivBagVolumeCon.text = "";
                        doseInIvBagCon.text = "";
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
                          "$total $currentItemForIvBagVolume / $currentItemForRequireDosageLastPerUnit",
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
