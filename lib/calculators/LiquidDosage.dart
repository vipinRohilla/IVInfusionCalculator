import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/formulas.dart/allFormulas.dart';
import 'package:flutter_application_2/widgets/buttonStyle.dart';
import 'package:flutter_application_2/styling/size_config.dart';
import '../widgets/getTextFromField.dart';

class LiquidDosage extends StatefulWidget {
  @override
  _LiquidDosageState createState() => _LiquidDosageState();
}

class _LiquidDosageState extends State<LiquidDosage> {
  List<String> unitsForRequiredDosage = [
    "ml/Kg",
    "L /kg",
  ];
  String currentItemForRequiredDosage = "ml/Kg";

  List<String> unitsForWeight = ["Kg", "lb"];
  String currentItemForWeight = "Kg";

  var requiredDosage = 0.0;
  var weight = 0.0;
  var total = 0.0;
  String currentItemForRequiredDosagePerUnit = "ml";

  final requiredDosageCon = new TextEditingController();
  final weightCon = new TextEditingController();
  double myFontSize = 1.9 * SizeConfig.textMultiplier;

  void numClick(String requiredDosage, String weight) {
    setState(() {
      total = getLiquidDosage(requiredDosage, weight);
      if (currentItemForRequiredDosage == "ml/Kg") {
        switch (currentItemForWeight) {
          case "Kg":
            {
              total = total;
              total = double.parse(total.toStringAsFixed(2));
            }

            break;
          case "lb":
            {
              total = total * 2.2046;
              total = double.parse(total.toStringAsFixed(2));
            }
        }
      } else if (currentItemForRequiredDosage == "L /kg") {
        total = total * 1000;
        switch (currentItemForWeight) {
          case "Kg":
            {
              total = total;
              total = double.parse(total.toStringAsFixed(2));
            }
            break;
          case "lb":
            {
              total = total * 2.2046;
              total = double.parse(total.toStringAsFixed(2));
            }
            break;
        }
      }
      currentItemForRequiredDosagePerUnit =
          currentItemForRequiredDosage.substring(0, 2);
    });
  }
 Widget _landScapeMode(){
    return  GridView.count(
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
                      child: getTextFromTextField(
                          "Enter Value",
                          "Required Dosage",
                          unitsForRequiredDosage,
                          currentItemForRequiredDosage,
                          requiredDosageCon)),
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
                              weightCon.text != "") {
                            numClick(requiredDosageCon.text, weightCon.text);
                          }
                        },
                        value: currentItemForRequiredDosage),
                  ),
                  ) ],
            ),
                ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.0),
                  Flexible(
                      child: getTextFromTextField("Enter Value", "Body Weight",
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
                          if (requiredDosageCon.text != "" &&
                              weightCon.text != "") {
                            numClick(requiredDosageCon.text, weightCon.text);
                          }
                        },
                        value: currentItemForWeight),
                  ),
                  ) ],
              ),
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
                    child: getTextFromTextField(
                        "Enter Value",
                        "Required Dosage",
                        unitsForRequiredDosage,
                        currentItemForRequiredDosage,
                        requiredDosageCon)),
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
                            weightCon.text != "") {
                          numClick(requiredDosageCon.text, weightCon.text);
                        }
                      },
                      value: currentItemForRequiredDosage),
                ),
                ) ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.0),
                Flexible(
                    child: getTextFromTextField("Enter Value", "Body Weight",
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
                        if (requiredDosageCon.text != "" &&
                            weightCon.text != "") {
                          numClick(requiredDosageCon.text, weightCon.text);
                        }
                      },
                      value: currentItemForWeight),
                ),
                )  ],
            ),
    ],);
  }
  @override
  Widget build(BuildContext context) {
     double _width = MediaQuery.of(context).size.width;
     
    return 
    // ListView(children: [
      // Container(
        // height: 550,
        // color: Colors.blue[50],
        // child: 
        ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          children: [
            Text(
              "Calulate  Doses by Body Weight",
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
                      Text("$total $currentItemForRequiredDosagePerUnit",
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
                      numClick(requiredDosageCon.text, weightCon.text);
                    },
                    style: getButtonStyle(Colors.blueGrey.shade800),
                    child: Text("Calculate", style: TextStyle(fontSize : myFontSize))),
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        weightCon.text = "";
                        requiredDosageCon.text = "";
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
