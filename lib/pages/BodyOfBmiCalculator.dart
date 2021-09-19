import 'package:flutter/material.dart';
import 'package:flutter_application_2/calculators/BmiCalculator.dart';
import 'package:flutter_application_2/widgets/appBar.dart';

class BodyOfBmiCalculator extends StatefulWidget {
  @override
  _BodyOfBmiCalculatorState createState() => _BodyOfBmiCalculatorState();
}

class _BodyOfBmiCalculatorState extends State<BodyOfBmiCalculator> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: getAppBar("BMI Calculator"),
        body: BmiCalculator(),
        // body: Body(),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 4.0,
          fixedColor: Colors.blue[50],
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blue[900],
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
                backgroundColor: Colors.blue[900]),
            BottomNavigationBarItem(
                icon: Icon(Icons.note),
                label: 'Note',
                backgroundColor: Colors.blue[900]),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
                backgroundColor: Colors.blue[900]),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
