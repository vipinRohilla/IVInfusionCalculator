import 'package:flutter/material.dart';
import 'widgets/appBar.dart';
import 'widgets/card.dart';
import '/pages/BodyOfInfusionRate.dart';
import '/pages/BodyOfIvVolumeRateAndDropRate.dart';
import 'pages/BodyOfBmiCalculator.dart';
import 'pages/BodyOfBsaCalculator.dart';
import 'pages/BodyOfDosageByWeight.dart';
import 'pages/BodyOfNumberOfTablets.dart';
import 'pages/BodyOfVolumeInLiquid.dart';

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
            getCard("Infusion \nRate", Colors.blue.shade500, context,
                BodyOfInfusionRate()),
            getCard("Number of \nTablets", Colors.blue.shade500, context,
                BodyOfNumberOfTablets()),
            getCard("Volume in \nLiquid", Colors.blue.shade500, context,
                BodyOfVolumeInLiquid()),
            getCard("Doses by\nBody Weight", Colors.blue.shade500, context,
                BodyOfDosageByWeight()),
            getCard("Volume Rate\nand\nDrop Rate", Colors.blue.shade500,
                context, BodyOfIvVolumeAndDropRate()),
            getCard("BMI \nCalculator", Colors.blue.shade500, context,
                BodyOfBmiCalculator()),
            getCard("BSA \nCalculator", Colors.blue.shade500, context,
                BodyOfBsaCalculator()),
          ],
        ));
  }
}
