import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/formulas.dart/allFormulas.dart';
import 'package:flutter_application_2/widgets/buttonStyle.dart';
import 'package:flutter_application_2/styling/size_config.dart';
import '../widgets/getTextFromField.dart';

class Dose extends StatefulWidget {
  @override
  _DoseState createState() => _DoseState();
}

class _DoseState extends State<Dose> {
  List<String> unitsForStockStrength = ["mg", "g"];
  String currentItemForStockStrength = "mg";

  List<String> unitsForStockVolume = ["mL"];
  String currentItemForStockVolume = "mL";

  List<String> unitsForRequiredDosage = ["mg/Kg"];
  String currentItemForRequiredDosage = "mg/Kg";

  List<String> unitsForBodyWeight = ["Kg", "lb"];
  String currentItemForBodyWeight = "Kg";

  var stockStrength = 0.0;
  var stockVolume = 0.0;
  var requiredDosage = 0.0;
  var weight = 0.0;
  var total = 0.0;

  final stockStrengthCon = new TextEditingController();
  final stockVolumeCon = new TextEditingController();
  final requiredDosageCon = new TextEditingController();
  final weightCon = new TextEditingController();
  double myFontSize = 1.9 * SizeConfig.textMultiplier;

  void numClick(String stockStrength, String stockVolume, String requiredDosage,
      String weight) {
    setState(() {
      total = getDose(stockStrength, stockVolume, requiredDosage, weight);
      if (currentItemForStockStrength == "mg") {
        total = getDose(stockStrength, stockVolume, requiredDosage, weight);
        switch (currentItemForBodyWeight) {
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
      } else if (currentItemForStockStrength == "g") {
        total = getDose(stockStrength, stockVolume, requiredDosage, weight);
        total = total * 1000;
        switch (currentItemForBodyWeight) {
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
                              stockVolumeCon.text != "" &&
                              requiredDosageCon.text != "" &&
                              weightCon.text != "") {
                            numClick(stockStrengthCon.text, stockVolumeCon.text,
                                requiredDosageCon.text, weightCon.text);
                          }
                        },
                        value: currentItemForStockStrength),
                  ),
                  )],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      child: getTextFromTextField(
                          "Enter Value",
                          "Stock Volume",
                          unitsForStockVolume,
                          currentItemForStockVolume,
                          stockVolumeCon)),
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
                          if (stockStrengthCon.text != "" &&
                              stockVolumeCon.text != "" &&
                              requiredDosageCon.text != "" &&
                              weightCon.text != "") {
                            numClick(stockStrengthCon.text, stockVolumeCon.text,
                                requiredDosageCon.text, weightCon.text);
                          }
                        },
                        value: currentItemForStockVolume),
                  ),
                  )],
              ),
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
                              stockVolumeCon.text != "" &&
                              requiredDosageCon.text != "" &&
                              weightCon.text != "") {
                            numClick(stockStrengthCon.text, stockVolumeCon.text,
                                requiredDosageCon.text, weightCon.text);
                          }
                        },
                        value: currentItemForRequiredDosage),
                  ),
                  )],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      child: getTextFromTextField(
                          "Enter Value",
                          "Body Weight",
                          unitsForBodyWeight,
                          currentItemForBodyWeight,
                          weightCon)),
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
                        items:
                            unitsForBodyWeight.map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            this.currentItemForBodyWeight = newValue.toString();
                          });
                          if (stockStrengthCon.text != "" &&
                              stockVolumeCon.text != "" &&
                              requiredDosageCon.text != "" &&
                              weightCon.text != "") {
                            numClick(stockStrengthCon.text, stockVolumeCon.text,
                                requiredDosageCon.text, weightCon.text);
                          }
                        },
                        value: currentItemForBodyWeight),
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
                              stockVolumeCon.text != "" &&
                              requiredDosageCon.text != "" &&
                              weightCon.text != "") {
                            numClick(stockStrengthCon.text, stockVolumeCon.text,
                                requiredDosageCon.text, weightCon.text);
                          }
                        },
                        value: currentItemForStockStrength),
                  ),
                  )],
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      child: getTextFromTextField(
                          "Enter Value",
                          "Stock Volume",
                          unitsForStockVolume,
                          currentItemForStockVolume,
                          stockVolumeCon)),
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
                          if (stockStrengthCon.text != "" &&
                              stockVolumeCon.text != "" &&
                              requiredDosageCon.text != "" &&
                              weightCon.text != "") {
                            numClick(stockStrengthCon.text, stockVolumeCon.text,
                                requiredDosageCon.text, weightCon.text);
                          }
                        },
                        value: currentItemForStockVolume),
                  ),
                  )],
              ),
              SizedBox(height: 10.0),
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
                              stockVolumeCon.text != "" &&
                              requiredDosageCon.text != "" &&
                              weightCon.text != "") {
                            numClick(stockStrengthCon.text, stockVolumeCon.text,
                                requiredDosageCon.text, weightCon.text);
                          }
                        },
                        value: currentItemForRequiredDosage),
                  ),
                  )],
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      child: getTextFromTextField(
                          "Enter Value",
                          "Body Weight",
                          unitsForBodyWeight,
                          currentItemForBodyWeight,
                          weightCon)),
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
                        items:
                            unitsForBodyWeight.map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            this.currentItemForBodyWeight = newValue.toString();
                          });
                          if (stockStrengthCon.text != "" &&
                              stockVolumeCon.text != "" &&
                              requiredDosageCon.text != "" &&
                              weightCon.text != "") {
                            numClick(stockStrengthCon.text, stockVolumeCon.text,
                                requiredDosageCon.text, weightCon.text);
                          }
                        },
                        value: currentItemForBodyWeight),
                  ),
                  )],
              ),
    ],);
  }
  @override
  Widget build(BuildContext context) {
     double _width = MediaQuery.of(context).size.width;
     
    return 
    // // ListView(children: [
    //   SingleChildScrollView(
    //     // child: Container(
    //       // height: 250,
    //       // color: Colors.blue[50],
    //       child: 
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            children: [
              Text(
                "Calulate  the  Dose",
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
                        Text("$total $currentItemForStockVolume",
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
                        numClick(stockStrengthCon.text, stockVolumeCon.text,
                            requiredDosageCon.text, weightCon.text);
                      },
                      style: getButtonStyle(Colors.blueGrey.shade800),
                      child: Text("Calculate", style: TextStyle(fontSize : myFontSize))),
                  SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          weightCon.text = "";
                          stockStrengthCon.text = "";
                          stockVolumeCon.text = "";
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
      // ),
    // );
  }
}
