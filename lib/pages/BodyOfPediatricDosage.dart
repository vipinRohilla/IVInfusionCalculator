import 'package:flutter/material.dart';
import 'package:flutter_application_2/calculators/childDose.dart';
import 'package:flutter_application_2/calculators/dose.dart';

class BodyOfPediatricDosage extends StatefulWidget {
  @override
  _BodyOfPediatricDosageState createState() => _BodyOfPediatricDosageState();
}

class _BodyOfPediatricDosageState extends State<BodyOfPediatricDosage> {
  List<Widget> containers = [ChildDose(), Dose()];
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
            "Pediatric Dosage",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(tabs: <Widget>[
            Tab(
              child: Text("Child Dose", style: TextStyle(color: Colors.black)),
            ),
            Tab(
              child: Text("Dose", style: TextStyle(color: Colors.black)),
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
