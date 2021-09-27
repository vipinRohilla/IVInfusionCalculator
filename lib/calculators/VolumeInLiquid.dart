import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/formulas.dart/allFormulas.dart';
import 'package:flutter_application_2/widgets/buttonStyle.dart';
import '../widgets/getTextFromField.dart';

class VolumeInLiquid extends StatefulWidget {
  @override
  _VolumeInLiquidState createState() => _VolumeInLiquidState();
}

class _VolumeInLiquidState extends State<VolumeInLiquid> {
  List<String> unitsForStockVolume = [
    "ml",
    "L",
  ];
  String currentItemForStockVolume = "ml";

  List<String> unitsForRequiredDosage = ["mg"];
  String currentItemForRequiredDosage = "mg";

  List<String> unitsForStocksStrength = ["mg", "g", "Kg"];
  String currentItemForStocksStrength = "mg";

  var stockVolume = 0.0;
  var requiredDosage = 0.0;
  var stockStrength = 0.0;
  var total = 0.0;

  final stockVolumeCon = new TextEditingController();
  final requiredDosageCon = new TextEditingController();
  final stockStrengthCon = new TextEditingController();

  void numClick(
      String stockVolume, String requiredDosage, String stockStrength) {
    setState(() {
      total = getVolumeInLiquid(stockVolume, requiredDosage, stockStrength);
      if (currentItemForStocksStrength == "mg") {
        total = getVolumeInLiquid(stockVolume, requiredDosage, stockStrength);
        switch (currentItemForStockVolume) {
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
      } else if (currentItemForStocksStrength == "g") {
        total = getVolumeInLiquid(stockVolume, requiredDosage, stockStrength);
        total = total / 1000;
        switch (currentItemForStockVolume) {
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
      } else if (currentItemForStocksStrength == "Kg") {
        total = getVolumeInLiquid(stockVolume, requiredDosage, stockStrength);
        total = total * 1000000;
        switch (currentItemForStockVolume) {
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
              "Calulate  the  total volume  in Liquid",
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
                        "Stock Volume",
                        unitsForStockVolume,
                        currentItemForStockVolume,
                        stockVolumeCon)),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        iconSize: 30.0,
                        iconEnabledColor: Colors.blue,
                        items: unitsForStockVolume
                            .map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            this.currentItemForStockVolume =
                                newValue.toString();
                          });
                          if (stockVolumeCon.text != "" &&
                              requiredDosageCon.text != "" &&
                              stockStrengthCon.text != "") {
                            numClick(stockVolumeCon.text,
                                requiredDosageCon.text, stockStrengthCon.text);
                          }
                        },
                        value: currentItemForStockVolume,
                      ),
                    ))
              ],
            ),
            SizedBox(height: 10.0),
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
                          if (stockVolumeCon.text != "" &&
                              requiredDosageCon.text != "" &&
                              stockStrengthCon.text != "") {
                            numClick(stockVolumeCon.text,
                                requiredDosageCon.text, stockStrengthCon.text);
                          }
                        },
                        value: currentItemForRequiredDosage,
                      ),
                    ))
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Flexible(
                    child: getTextFromTextField(
                        "Enter Value",
                        "Stock Strength",
                        unitsForStocksStrength,
                        currentItemForStocksStrength,
                        stockStrengthCon)),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        iconSize: 30.0,
                        iconEnabledColor: Colors.blue,
                        items: unitsForStocksStrength
                            .map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            this.currentItemForStocksStrength =
                                newValue.toString();
                          });
                          if (stockVolumeCon.text != "" &&
                              requiredDosageCon.text != "" &&
                              stockStrengthCon.text != "") {
                            numClick(stockVolumeCon.text,
                                requiredDosageCon.text, stockStrengthCon.text);
                          }
                        },
                        value: currentItemForStocksStrength,
                      ),
                    ))
              ],
            ),
            SizedBox(height: 10.0),
            SizedBox(
              height: 100,
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
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      SizedBox(height: 10.0),
                      Text("$total $currentItemForStockVolume",
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
                      numClick(stockVolumeCon.text, requiredDosageCon.text,
                          stockStrengthCon.text);
                    },
                    style: getButtonStyle(Colors.blueGrey.shade800),
                    child: Text("Calculate")),
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        stockVolumeCon.text = "";
                        stockStrengthCon.text = "";
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
