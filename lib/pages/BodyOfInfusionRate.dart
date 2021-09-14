import 'package:flutter/material.dart';
import '../calculators/InfusionByUnit.dart';
import '../calculators/InfusionByDose.dart';

class BodyOfInfusionRate extends StatefulWidget {
  @override
  _BodyOfInfusionRateState createState() => _BodyOfInfusionRateState();
}

class _BodyOfInfusionRateState extends State<BodyOfInfusionRate> {
  List<Widget> containers = [InfusionByUnit(), InfusionByDose()];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.blue),
          backgroundColor: Colors.blue[50],
          elevation: 1,
          title: Text(
            "IV Infusion Calculator",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(tabs: <Widget>[
            Tab(
              child: Text("Infusion by Unit",
                  style: TextStyle(color: Colors.black)),
            ),
            Tab(
              child: Text("Infusion by Dose",
                  style: TextStyle(color: Colors.black)),
            )
          ]),
        ),
        body: TabBarView(children: containers),
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
