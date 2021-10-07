import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/formulas.dart/allFormulas.dart';
import 'package:flutter_application_2/widgets/buttonStyle.dart';
import 'package:flutter_application_2/styling/size_config.dart';
import '../widgets/getTextFromField.dart';

class NumberOfTablets extends StatefulWidget {
  @override
  _NumberOfTabletsState createState() => _NumberOfTabletsState();
}

class _NumberOfTabletsState extends State<NumberOfTablets> {
  List<String> unitsForRequiredDosage = ["mg", "g"];
  String currentItemForRequiredDosage = "mg";

  List<String> unitsForStockStrength = ["mg", "g"];
  String currentItemForStockStrength = "mg";

  var requiredDosage = 0.0;
  var stockStrength = 0.0;
  var total = 0.0;

  final requiredDosageCon = new TextEditingController();
  final stockStrengthCon = new TextEditingController();
  double myFontSize = 1.9 * SizeConfig.textMultiplier;

  void numClick(String requiredDosage, String stockStrength) {
    setState(() {
      if (currentItemForRequiredDosage == "mg") {
        if (currentItemForStockStrength == "mg") {
          total = getNumberOfTablets(requiredDosage, stockStrength);
        } else if (currentItemForStockStrength == "g") {
          total = getNumberOfTablets(requiredDosage, stockStrength);
          total = total / 1000;
        }
      } else if (currentItemForRequiredDosage == "g") {
        if (currentItemForStockStrength == "mg") {
          total = getNumberOfTablets(requiredDosage, stockStrength);
          total = total * 1000;
        } else if (currentItemForStockStrength == "g") {
          total = getNumberOfTablets(requiredDosage, stockStrength);
        }
      }
    });
  }
 Widget _landScapeMode(){
    return  GridView.count(
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
                    child: getTextFromTextField(
                        "Enter Value",
                        "Required Dosage",
                        unitsForRequiredDosage,
                        currentItemForRequiredDosage,
                        requiredDosageCon)),
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
                      if (stockStrengthCon.text != "" &&
                          requiredDosageCon.text != "") {
                        numClick(
                            stockStrengthCon.text, requiredDosageCon.text);
                      }
                      print(newValue);
                    },
                    value: currentItemForRequiredDosage,
                  ),
                ),
                ) ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    child: getTextFromTextField(
                        "Enter Value",
                        "Stock Strength",
                        unitsForStockStrength,
                        currentItemForStockStrength,
                        stockStrengthCon)),
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
                    items: unitsForStockStrength
                        .map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        this.currentItemForStockStrength =
                            newValue.toString();
                      });
                      if (stockStrengthCon.text != "" &&
                          requiredDosageCon.text != "") {
                        numClick(
                            stockStrengthCon.text, requiredDosageCon.text);
                      }
                    },
                    value: currentItemForStockStrength,
                  ),
                ),
                ) ],
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
                      if (stockStrengthCon.text != "" &&
                          requiredDosageCon.text != "") {
                        numClick(
                            stockStrengthCon.text, requiredDosageCon.text);
                      }
                      print(newValue);
                    },
                    value: currentItemForRequiredDosage,
                  ),
                ),
                ) ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    child: getTextFromTextField(
                        "Enter Value",
                        "Stock Strength",
                        unitsForStockStrength,
                        currentItemForStockStrength,
                        stockStrengthCon)),
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
                    items: unitsForStockStrength
                        .map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        this.currentItemForStockStrength =
                            newValue.toString();
                      });
                      if (stockStrengthCon.text != "" &&
                          requiredDosageCon.text != "") {
                        numClick(
                            stockStrengthCon.text, requiredDosageCon.text);
                      }
                    },
                    value: currentItemForStockStrength,
                  ),
                ),
                ) ],
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
              "Calulate  Number of Tablets",
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
                  padding: EdgeInsets.all(15.0),
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
              children: [
                ElevatedButton(
                    onPressed: () {
                      numClick(requiredDosageCon.text, stockStrengthCon.text);
                    },
                    style: getButtonStyle(Colors.blueGrey.shade800),
                    child: Text(
                      "Calculate",
                      style: TextStyle(),
                    )),
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        stockStrengthCon.text = "";
                        requiredDosageCon.text = "";
                        total = 0.0;
                      });
                    },
                    style: getButtonStyle(Colors.red.shade600),
                    child: Text(
                      "Clear",
                    )),
              ],
            ),
          ],
        );
      // ),
    // ]);
  }
}
