import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/appBar.dart';
import 'package:flutter_application_2/calculators/numberOfTablets.dart';

class BodyOfNumberOfTablets extends StatefulWidget {
  @override
  _BodyOfNumberOfTabletsState createState() => _BodyOfNumberOfTabletsState();
}

class _BodyOfNumberOfTabletsState extends State<BodyOfNumberOfTablets> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: getAppBar("Number of Tablets"),
        body: NumberOfTablets(),
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
                backgroundColor: Colors.blue[900])
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
