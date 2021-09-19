import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/formulas.dart/allFormulas.dart';
import 'package:flutter_application_2/widgets/buttonStyle.dart';
import '../widgets/getTextFromField.dart';

class IvVolumeRate extends StatefulWidget {
  @override
  _IvVolumeRateState createState() => _IvVolumeRateState();
}

class _IvVolumeRateState extends State<IvVolumeRate> {
  List<String> unitsForRequiredDosage = [
    "mL",
    "L",
  ];
  String currentItemForRequiredDosage = "mL";

  List<String> unitsForTime = ["hr", "min", "sec"];
  String currentItemForTime = "hr";

  var requiredDosage = 0.0;
  var time = 0.0;
  var total = 0.0;

  final requiredDosageCon = new TextEditingController();
  final timeCon = new TextEditingController();

  void numClick(String requiredDosage, String time) {
    setState(() {
      total = getIvVolumeRate(requiredDosage, time);
      if (currentItemForTime == "hr") {
        total = getIvVolumeRate(requiredDosage, time);
        switch (currentItemForRequiredDosage) {
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
      } else if (currentItemForTime == "min") {
        total = getIvVolumeRate(requiredDosage, time);
        total = total * 60;
        switch (currentItemForRequiredDosage) {
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
      } else if (currentItemForTime == "sec") {
        total = getIvVolumeRate(requiredDosage, time);
        total = total * 3600;
        switch (currentItemForRequiredDosage) {
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
              "Calulate  IV Volume Rate",
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
                              timeCon.text != "") {
                            numClick(requiredDosageCon.text, timeCon.text);
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
                Flexible(
                    child: getTextFromTextField("Enter Value", "Time",
                        unitsForTime, currentItemForTime, timeCon)),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        iconSize: 30.0,
                        iconEnabledColor: Colors.blue,
                        items: unitsForTime.map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            this.currentItemForTime = newValue.toString();
                          });
                          if (requiredDosageCon.text != "" &&
                              timeCon.text != "") {
                            numClick(requiredDosageCon.text, timeCon.text);
                          }
                        },
                        value: currentItemForTime),
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
                      Text(
                          "$total $currentItemForRequiredDosage / $currentItemForTime",
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
                      numClick(requiredDosageCon.text, timeCon.text);
                    },
                    style: getButtonStyle(Colors.blueGrey.shade800),
                    child: Text("Calculate")),
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        timeCon.text = "";
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
