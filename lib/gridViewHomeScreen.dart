import 'package:flutter/material.dart';
import 'package:flutter_application_2/appBar.dart';
import 'package:flutter_application_2/bodyFour.dart';
import 'package:flutter_application_2/bodyOne.dart';
import 'package:flutter_application_2/bodyThree.dart';
import 'package:flutter_application_2/bodyTwo.dart';
import 'package:flutter_application_2/card.dart';

class GridViewHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade50,
        appBar: getAppBar("IV Infusion Calculator"),
        body: GridView.count(
          padding: EdgeInsets.all(20.0),
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          crossAxisCount: 2,
          children: [
            getCard("Infusion \nRate", Colors.red.shade600, context, BodyOne()),
            getCard("Volume and \nTime", Colors.purple.shade500, context,
                BodyTwo()),
            getCard("Medication", Colors.orange.shade600, context, BodyThree()),
            getCard("Number of \nTablets", Colors.blue.shade500, context,
                BodyFour()),
            getCard("Pediatric \nCalculation", Colors.blue.shade800, context,
                BodyThree()),
            getCard("Volume of \nLiquid", Colors.green.shade600, context,
                BodyThree()),
            getCard("Dosage by \nBodyWeight", Colors.pinkAccent, context,
                BodyThree()),
          ],
        ));
  }
}
