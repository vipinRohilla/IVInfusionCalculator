import 'package:flutter/material.dart';
import 'package:flutter_application_2/calculators/BsaCalculator.dart';
import 'package:flutter_application_2/widgets/appBar.dart';

class BodyOfBsaCalculator extends StatefulWidget {
  @override
  _BodyOfBsaCalculatorState createState() => _BodyOfBsaCalculatorState();
}

class _BodyOfBsaCalculatorState extends State<BodyOfBsaCalculator> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: getAppBar("BSA Calculator"),
        body: BsaCalculator(),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 4.0,
          fixedColor: Colors.blue[50],
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.note),
                label: 'Note',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
                backgroundColor: Colors.blue)
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
