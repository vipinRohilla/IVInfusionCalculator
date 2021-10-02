import 'package:flutter/material.dart';
import 'package:flutter_application_2/calculators/VolumeInLiquid.dart';
import 'package:flutter_application_2/widgets/appBar.dart';
import 'package:flutter_application_2/styling/size_config.dart';

class BodyOfVolumeInLiquid extends StatefulWidget {
  @override
  _BodyOfVolumeInLiquidState createState() => _BodyOfVolumeInLiquidState();
}

class _BodyOfVolumeInLiquidState extends State<BodyOfVolumeInLiquid> {
  int _currentIndex = 0;
  double myFontSize = 1.9 * SizeConfig.textMultiplier;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: getAppBar("Volume in Liquid"),
        body: VolumeInLiquid(),
        // body: Body(),
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
              backgroundColor: Colors.blue[900],
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.note),
              label: 'Note',
              backgroundColor: Colors.blue[900],
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              backgroundColor: Colors.blue[900],
            )
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
