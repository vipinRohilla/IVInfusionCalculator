import 'package:flutter/material.dart';
import 'package:flutter_application_2/styling/size_config.dart';
import 'pages/BodyOfPediatricDosage.dart';
import 'widgets/appBar.dart';
import 'widgets/card.dart';
import '/pages/BodyOfInfusionRate.dart';
import '/pages/BodyOfIvVolumeRateAndDropRate.dart';
import 'pages/BodyOfBmiCalculator.dart';
import 'pages/BodyOfBsaCalculator.dart';
import 'pages/BodyOfDosageByWeight.dart';
import 'pages/BodyOfNumberOfTablets.dart';
import 'pages/BodyOfVolumeInLiquid.dart';

final Color containerColor = Colors.blue.shade900;
final List<String> list = [
  "Infusion Rate",
  "Pediatric Dosage",
  "Number of Tablets",
  "Volume in Liquid",
  "Doses by Body Weight",
  "Volume and Drop Rate",
  "BMI Calculator",
  "BSA Calculator",
  "Unit Converter"
];

List<Widget> widgetList = [
  BodyOfInfusionRate(),
  BodyOfPediatricDosage(),
  BodyOfNumberOfTablets(),
  BodyOfVolumeInLiquid(),
  BodyOfDosageByWeight(),
  BodyOfIvVolumeAndDropRate(),
  BodyOfBmiCalculator(),
  BodyOfBsaCalculator()
];

class GridViewHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(
        builder: (context, orientation) {
          SizeConfig().init(constraints, orientation);
          return Scaffold(
              drawer: Drawer(),
              backgroundColor: Colors.blue[50],
              appBar: getAppBar("IV Infusion Calculator"),
              body: GridView.count(
                padding: EdgeInsets.all(10.0),
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  getCard(
                      list[0], containerColor, context, BodyOfInfusionRate()),
                  getCard(list[1], containerColor, context,
                      BodyOfPediatricDosage()),
                  getCard(list[2], containerColor, context,
                      BodyOfNumberOfTablets()),
                  getCard(
                      list[3], containerColor, context, BodyOfVolumeInLiquid()),
                  getCard(
                      list[4], containerColor, context, BodyOfDosageByWeight()),
                  getCard(list[5], containerColor, context,
                      BodyOfIvVolumeAndDropRate()),
                  getCard(
                      list[6], containerColor, context, BodyOfBmiCalculator()),
                  getCard(
                      list[7], containerColor, context, BodyOfBsaCalculator()),
                  getCard(
                      list[8], containerColor, context, BodyOfBsaCalculator()),
                  // _contentGridView()
                ],
              ));
        },
      );
    });
  }
}

// Widget _contentGridView() {
//   return GridView.builder(
//       itemCount: list.length - 1,
//       gridDelegate:
//           SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
//       itemBuilder: (context, index) =>
//           Card(child: GridTile(child: Center(child: Text(index.toString())))));
// }


// getCard(list[index], containerColor, context,
                      // widgetList[index])