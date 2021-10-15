import 'package:flutter/material.dart';
import 'package:flutter_application_2/calculators/unitConverters/category_route.dart';
import 'package:flutter_application_2/styling/size_config.dart';

class BodyOfUnitConverter extends StatefulWidget {
  @override
  State<BodyOfUnitConverter> createState() => _BodyOfUnitConverterState();
}

class _BodyOfUnitConverterState extends State<BodyOfUnitConverter> {
  double myFontSize = 2.1 * SizeConfig.textMultiplier;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: 
          CategoryRoute(),
      ),
    );
  }
}
