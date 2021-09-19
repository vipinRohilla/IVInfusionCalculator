import 'package:flutter/material.dart';
import '/calculators/LiquidDosage.dart';
import '/calculators/TabletDosage.dart';
import '/calculators/UnitDosage.dart';

class BodyOfDosageByWeight extends StatefulWidget {
  @override
  _BodyOfDosageByWeightState createState() => _BodyOfDosageByWeightState();
}

class _BodyOfDosageByWeightState extends State<BodyOfDosageByWeight> {
  List<Widget> containers = [TabletDosage(), LiquidDosage(), UnitDosage()];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.blue),
          backgroundColor: Colors.blue[50],
          elevation: 1,
          title: Text(
            "Doses by Body Weight",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(tabs: <Widget>[
            Tab(
              child:
                  Text("Tablet Dosage", style: TextStyle(color: Colors.black)),
            ),
            Tab(
              child:
                  Text("Liquid Dosage", style: TextStyle(color: Colors.black)),
            ),
            Tab(
              child: Text("Unit Dosage", style: TextStyle(color: Colors.black)),
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
              backgroundColor: Colors.blue[900],
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
