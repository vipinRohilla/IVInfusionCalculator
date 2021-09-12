import 'package:flutter/material.dart';
import 'InfusionRate.dart';
import 'volume&time.dart';
import 'medication.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> containers = [
    // Container(color: Colors.purple),
    InfusionRate(),
    VolumeAndTime(),
    Medication()
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          backgroundColor: Colors.blue[50],
          elevation: 1,
          title: Text(
            "IV Infusion Calculator",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(tabs: <Widget>[
            Tab(
              child:
                  Text("Infusion Rate", style: TextStyle(color: Colors.black)),
            ),
            Tab(
              child:
                  Text("Volume & Time", style: TextStyle(color: Colors.black)),
            ),
            Tab(
              child: Text("Medication", style: TextStyle(color: Colors.black)),
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
