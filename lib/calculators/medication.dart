// // import 'dart:ui';

// // import 'package:flutter/material.dart';
// // import 'package:flutter/widgets.dart';
// // import 'package:flutter_application_2/widgets/buttonStyle.dart';
// // import 'package:flutter_application_2/widgets/elevatedButton.dart';

// // class Medication extends StatefulWidget {
// //   @override
// //   _MedicationState createState() => _MedicationState();
// // }

// // class _MedicationState extends State<Medication> {
// //   List<String> unit = ["mg", "g", "kg", "lg"];

// //   String currentItem = "mg";

// //   @override
// //   Widget build(BuildContext context) {
// //     return ListView(children: [
// //       Container(
// //         height: 550,
// //         color: Colors.blue[50],
// //         child: ListView(
// //           padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
// //           children: [
// //             Text(
// //               "Calulate  the  weight-based  Infusion   dosage  of  certain  durgs",
// //               style: TextStyle(
// //                 fontSize: myFontSize,
// //                 fontWeight: FontWeight.w600,
// //                 color: Colors.black,
// //               ),
// //             ),
// //             SizedBox(height: 19.0),
// //             Column(
// //               children: [
// //                 SizedBox(height: 10.0),
// //                 // getTextFromTextField("Enter Patient Weight", "Patient Weight",
// //                 //     unit, currentItem),
// //               ],
// //             ),
// //             SizedBox(height: 10.0),
// //             Column(
// //               children: [
// //                 SizedBox(height: 10.0),
// //                 // getTextFromTextField(
// //                 //     "Enter Drug Dose", "Drug Dose", unit, currentItem)
// //               ],
// //             ),
// //             SizedBox(height: 10.0),
// //             Column(
// //               mainAxisAlignment: MainAxisAlignment.start,
// //               children: [
// //                 SizedBox(height: 10.0),
// //                 Column(
// //                   children: [
// //                     Text("Drug Dilution", style: TextStyle(fontSize: 17)),
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: [
// //                         SizedBox(
// //                           width: 60,
// //                           child: TextField(
// //                             decoration: InputDecoration(
// //                               labelText: "mg",
// //                               labelStyle: TextStyle(
// //                                 fontSize: 16,
// //                                 color: Colors.black,
// //                               ),
// //                               suffixText: "mg",
// //                             ),
// //                             keyboardType: TextInputType.number,
// //                           ),
// //                         ),
// //                         SizedBox(
// //                           width: 20,
// //                         ),
// //                         Text("/", style: TextStyle(fontSize: 20)),
// //                         SizedBox(
// //                           width: 20,
// //                         ),
// //                         SizedBox(
// //                           width: 60,
// //                           child: TextField(
// //                             decoration: InputDecoration(
// //                               labelText: "mL",
// //                               labelStyle:
// //                                   TextStyle(fontSize: 16, color: Colors.black),
// //                               suffixText: "mL",
// //                             ),
// //                             keyboardType: TextInputType.number,
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ],
// //                 ),
// //               ],
// //             ),
// //             SizedBox(height: 10.0),
// //             Column(
// //               mainAxisAlignment: MainAxisAlignment.spaceAround,
// //               children: [
// //                 ElevatedButton(
// //                     onPressed: () {
// //                       // numClick(requiredDosageCon.text, stockStrengthCon.text);
// //                     },
// //                     style: getButtonStyle(Colors.blueGrey.shade800),
// //                     child: Text("Calculate", style: TextStyle(fontSize : myFontSize))),
// //                 SizedBox(height: 10),
// //                 GetElevatedButton(buttonText: "Clear", colorData: Colors.red),
// //               ],
// //             ),
// //             SizedBox(height: 10),
// //             SizedBox(
// //               height: 120,
// //               child: Container(
// //                   padding: EdgeInsets.all(10.0),
// //                   decoration: BoxDecoration(
// //                       borderRadius: BorderRadius.circular(5),
// //                       color:
//                           (total != 0.0) ? Colors.blue[400] : Colors.cyan[900]),
// //                   child: Column(
// //                     mainAxisAlignment: MainAxisAlignment.start,
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text("Result : ",
// //                           style: TextStyle(
// //                               letterSpacing: 2,
// fontSize: myFontSize,
// //                               fontWeight: FontWeight.w500,
// //                               color: Colors.white)),
// //                       SizedBox(height: 10.0),
// //                       Text("total",
// //                           style: TextStyle(
// //                               letterSpacing: 2,
// fontSize: myFontSize,
// //                               fontWeight: FontWeight.w500,
// //                               color: Colors.white))
// //                     ],
// //                   )),
// //             )
// //           ],
// //         ),
// //       ),
// //     ]);
// //   }
// // }
